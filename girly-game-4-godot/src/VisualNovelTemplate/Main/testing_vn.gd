class_name TestingVN
extends Control

@export_group("Main Nodes")
@export var background_img: TextureRect
@export var textbox: VNTextBox
@export var choices_buttons: HBoxContainer

@export_category("Assets")
@export_group("Visual Assets")
@export var characters: Dictionary[String, CharacterInfo]
@export var backgrounds: Dictionary[String, Texture]
var character_sprites: Dictionary[String, CharacterSprite]

@export_group("Audio Assets")
@export var music_tracks: Dictionary[String, AudioStream]
@export var sound_effects: Dictionary[String, AudioStream]

@export_category("Misc")
@export_group("Misc")
@export var character_sprite_scene: PackedScene
@export var level1 : String

var curr_player
var choices_added = false

func _ready() -> void:
	_bind_external_functions()
	
	InkManager.init_story(self)
	
	InkManager.next_line_reached.connect(_on_next_line_reached)
	InkManager.choices_reached.connect(_on_choices_reached)
	textbox.continued_story.connect(_on_button_pressed)
	
	_add_all_characters()


func _add_all_characters():
	for char_info in characters.values():
		var ch: CharacterSprite = character_sprite_scene.instantiate()
		ch.setup(char_info)
		ch.pivot_offset_ratio
		ch.hide()
		character_sprites[char_info.my_name] = ch
		background_img.add_sibling(ch)


func _on_next_line_reached(parsed_text : StoryMessage):
	textbox.setup(parsed_text.character, parsed_text.message)
	EXT_change_expression(parsed_text.character, parsed_text.expression)


func _on_choices_reached(choices):
	if not choices_added:
		for i in choices.size():
			var btn = Button.new()
			btn.size = Vector2(500, 500)
			btn.text = str(i) + choices[i].text
			btn.pressed.connect(select_choice.bind(btn))
			choices_buttons.add_child.call_deferred(btn)
		choices_added = true


func select_choice(button : Button):
	choices_added = false
	var index = int(button.text.substr(0,1))
	
	for child in choices_buttons.get_children():
		child.queue_free()
	
	InkManager.select_choice(index)


func _spell_check(entered_text : String, target_text : String, acceptable_range : float = 0.7):
	var correct_letters : int = 0
	var word_size : int
	entered_text = entered_text.to_lower()
	target_text = target_text.to_lower()
	
	if entered_text == target_text:
		print("No Spelling Mistake, Yippie!")
		return target_text
	
	if entered_text.length() == target_text.length():
		correct_letters += 1
	
	if entered_text.length() < target_text.length():
		word_size = entered_text.length()
	else:
		word_size = target_text.length()
		
	for i in word_size:
		if entered_text[i] == target_text[i]:
			correct_letters += 1
	
	for j in entered_text.length():
		if entered_text[j] in target_text:
			correct_letters += 1
	
	if correct_letters >= (target_text.length() * 2) * acceptable_range:
		print("Entered Text: %s. Did you mean '%s'?" % [entered_text, target_text])
		push_error("Entered Text: %s. Did you mean '%s'?" % [entered_text, target_text])
		return target_text
	else:
		print("May the lord save you from your sins...")
		return entered_text


func _on_button_pressed() -> void: InkManager.continue_story()

# ==============================================================
# External INK Functions
# ==============================================================

func _bind_external_functions() -> void:
	InkManager.bind_to_ink("background", EXT_background, self)
	InkManager.bind_to_ink("load_scene", EXT_load_scene, self)
	InkManager.bind_to_ink("speak", EXT_speak, self)
	InkManager.bind_to_ink("move", EXT_move_character, self)
	InkManager.bind_to_ink("show_or_hide", EXT_show_or_hide, self)
	InkManager.bind_to_ink("change_expression", EXT_change_expression, self)
	InkManager.bind_to_ink("play_music", EXT_play_music, self)
	InkManager.bind_to_ink("play_sfx", EXT_play_sfx, self)
	InkManager.bind_to_ink("animate", EXT_animate, self)


func EXT_change_expression(who: String, new_exp: String):
	if who.strip_edges() == "" or new_exp.strip_edges() == "":
		return
	if not who in character_sprites.keys():
		push_error("Bro wtf, why you giving me an invalid character, that's not nice")
		return
	
	var character: CharacterSprite = character_sprites.get(who)
	character.change_expression(new_exp)


func EXT_show_or_hide(who: String, appear: bool):
	async_EXT_show_or_hide(who, appear)


func async_EXT_show_or_hide(who: String, appear: bool):
	var character: CharacterSprite = character_sprites.get(who)
	
	if tween and tween.is_running():
		await tween.finished
	
	tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_BACK)
	if appear:
		var init_pos : float = character.global_position.x
		var init_size : float = character.size.x * 2
		var dur = 0.8
		character.global_position.x += init_size
		character.show()
		
		tween.tween_property(character, "global_position:x", init_pos, dur)
		
		await tween.finished
		
	else:
		var init_pos : float = character.global_position.x
		var init_size : float = character.size.x * 2
		var final_pos : float = init_pos + init_size
		var dur = 0.8
		
		tween.tween_property(character, "global_position:x", final_pos, dur)
		
		await tween.finished
		
		character.hide()
		character.global_position.x = init_pos


func EXT_move_character(who: String, where: int):
	var character : CharacterSprite = character_sprites[who]
	character.move_to(where)


func EXT_load_scene(scene : String):
	if "level" in scene:
		get_tree().change_scene_to_file(level1)


func EXT_background(key : String):
	var bg = backgrounds.get(key)
	background_img.texture = bg


func EXT_speak(who : String, word : String):
	var character = characters.get(who)
	$Voice.stream = character.get_voiceline(word)
	$Voice.play()


func EXT_play_music(which: String):
	var song = music_tracks.get(which)
	$Music.stream = song
	$Music.play()


func EXT_play_sfx(which: String):
	var sound = sound_effects.get(which)
	$SoundEffects.stream = sound
	$SoundEffects.play()

var tween : Tween

func EXT_animate(who: String, which: String):
	async_EXT_animate(who, which)


func async_EXT_animate(who: String, which: String):
	if tween and tween.is_running():
		await tween.finished
		
	match which:
		"zoom_in":
			zoom_in_animation(who)
		"reset_zoom":
			reset_zoom_animation(who)
		"pulse":
			pulse_animation(who)


func reset_zoom_animation(who: String):
	var character : CharacterSprite = character_sprites.get(who)
	var scale_param = Vector2(1.0, 1.0)
	var final_pos = 0.0
	var dur = 1.0
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CIRC)
	
	tween.tween_property(character, "scale", scale_param, dur)
	tween.parallel().tween_property(character, "global_position:y", final_pos, dur)


func zoom_in_animation(who: String):
	var character : CharacterSprite = character_sprites.get(who)
	var scale_param = character.scale + Vector2(0.8, 0.8)
	var final_pos = character.global_position.y + 5
	var dur = 0.5
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SPRING)
	
	tween.tween_property(character, "scale", scale_param, dur)
	tween.parallel().tween_property(character, "global_position:y", final_pos, dur)


func pulse_animation(who: String):
	var character : CharacterSprite = character_sprites.get(who)
	var init_scale = character.scale
	var scale_param = character.scale + Vector2(0.1, 0.1)
	var dur = 0.2
	
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SPRING)
	
	tween.tween_property(character, "scale", scale_param, dur)
	tween.tween_property(character, "scale", init_scale, dur)
