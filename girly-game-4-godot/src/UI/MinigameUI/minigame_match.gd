extends Control

@export var glossary : DialogicGlossary = Global.glossary
@export var hiragana_letters : TranslateDictionary = load("uid://cbdooaaiqyw8d")
@export var katakana_letters : TranslateDictionary = load("uid://be8dikuw87xwb")

@export var on_clicked_sound : AudioStream = load("uid://8jmsy5l5yd1l")
@export var on_matched_sound : AudioStream = load("uid://dsdfajvkul3th")
@export var on_wrong_sound : AudioStream = load("uid://bf46uodjtpcoq")
@export var on_hovered_sound : AudioStream = load("uid://cx258ok0kcfo8")

@export var on_skipped_sound : AudioStream = load("uid://dcxhhblaywrvd")
func _ready() -> void:
	connect_buttons()

func start_minigame(meta : String) -> void:
	update_rounds()
	var previous_round = get_parent().current_rounds-1
	if previous_round < 0:
		$AnimationPlayer.play("minigame_in")
	elif !get_parent().minigame_order.get(clamp(previous_round,0,get_parent().rounds)) == self:
		$AnimationPlayer.play("minigame_in")
	fill_words(meta)
	self.show()
func end_minigame() -> void:
	var next_round = get_parent().current_rounds + 1
	if next_round > get_parent().rounds:
		$AnimationPlayer.play("minigame_out")
	elif !get_parent().minigame_order.get(clamp(next_round,0,get_parent().rounds)) == self:
		$AnimationPlayer.play("minigame_out")
	
	for button in %WordsEN.get_children()+%WordsJP.get_children():
		button.disabled = false
		button.set_pressed_no_signal(false)
	EventBus.minigame_round_end.emit()

#______________-LOGIC-______________#
func connect_buttons() -> void:
	for button in %WordsJP.get_children():
		button.toggled.connect(_on_clicked.bind(true, button))
		button.mouse_entered.connect(_on_button_mouse_entered)
	for answer_button in %WordsEN.get_children():
		answer_button.toggled.connect(_on_clicked.bind(false, answer_button))
		answer_button.mouse_entered.connect(_on_button_mouse_entered)
var stored_word : String = ""
func _on_clicked(toggled_on : bool ,jp : bool ,button : TextureButton) -> void:
	if !toggled_on:
		return
	var word = button.get_node("Label").text

	if jp:
		if stored_word == answers_dictionary[word]:
			$Effects.volume_db = -9.0
			AudioManager.play_sfx($Effects, on_matched_sound)
			disable_buttons(true, button)
		elif stored_word == "":
			stored_word = word
		elif stored_word != answers_dictionary[word]:
			$Effects.volume_db = 0.0
			AudioManager.play_sfx($Effects, on_wrong_sound)
			clear_buttons()
	else:
		var good_key = answers_dictionary.find_key(word) #answers_dictionary[ ]
		if stored_word == good_key:
			$Effects.volume_db = -9.0
			AudioManager.play_sfx($Effects, on_matched_sound)
			disable_buttons(false, button)
		elif stored_word == "":
			stored_word = word
		elif stored_word != good_key:
			$Effects.volume_db = 0.0
			AudioManager.play_sfx($Effects, on_wrong_sound)
			clear_buttons()
	AudioManager.play_sfx($Button, on_clicked_sound)

func clear_buttons() -> void:
	stored_word = ""
	for button in %WordsEN.get_children()+%WordsJP.get_children():
		if button.button_pressed:
			button.set_pressed_no_signal(false)

func disable_buttons(jp: bool, button : TextureButton) -> void:
	var button1 : String = button.get_node("Label").text
	var button2 : String
	if jp:
		button2 = answers_dictionary[button1]
	else:
		button2 = answers_dictionary.find_key(button1)
	for child in %WordsEN.get_children() + %WordsJP.get_children():
		if child.get_node("Label").text == button1 or child.get_node("Label").text == button2:
			child.set_pressed_no_signal(false)
			child.disabled = true
	stored_word = ""
	if _detect_end():
		end_minigame()

func _detect_end() -> bool:
	for child in %WordsEN.get_children() + %WordsJP.get_children():
		if !child.disabled:
			return false
	return true

#__________-PREPARE WORDS-__________#
var answers_dictionary : Dictionary[String, String] = {}
func fill_words(meta : String) -> void:
	var words = get_lists(meta)
	var JP_children : Array = %WordsJP.get_children()
	var EN_children : Array = %WordsEN.get_children()
	for i in JP_children.size():
		var word = words.pick_random()
		var answer = answers_dictionary[word]
		
		var button = JP_children.pick_random()
		var answer_button = EN_children.pick_random()
		
		button.get_node("Label").text = word
		answer_button.get_node("Label").text = answer
		
		words.erase(word)
		JP_children.erase(button)
		EN_children.erase(answer_button)

func get_lists(meta : String) -> Array:
	var jp_list : Array = [meta]
	update_answers_dictionary(meta)
	
	for entry in glossary.entries.keys():
		if glossary.entries[entry] is Dictionary and entry != meta:
			var unlocked_word = glossary.entries[entry].get_or_add("unlocked", false)
			if unlocked_word:
				jp_list.append(entry)
				update_answers_dictionary(entry)
	if %WordsJP.get_child_count() > jp_list.size():
		var character_dict : Dictionary = {}
		#get a list with a ref to all the child answers
		if meta[0] in hiragana_letters.basic_dictionary:
			character_dict = hiragana_letters.basic_dictionary
		if meta[0] in katakana_letters.basic_dictionary:
			character_dict = katakana_letters.basic_dictionary
		
		for i in %WordsJP.get_child_count() - jp_list.size():
			var new_key = character_dict.keys().pick_random()
			jp_list.append(new_key)
			update_answers_dictionary(new_key)
	return jp_list
func update_answers_dictionary(key : String)-> void:
	var value : String = ""
	if key in katakana_letters.basic_dictionary:
		value = katakana_letters.basic_dictionary[key]
	elif key in hiragana_letters.basic_dictionary:
		value = hiragana_letters.basic_dictionary[key]
	elif key in glossary.entries.keys():
		pass
		value = glossary.entries[key]["title"]
	answers_dictionary.set(key, value)


func _on_exit_button_pressed() -> void:
	AudioManager.play_sfx($Button, on_skipped_sound)
	
	EventBus.minigame_skipped.emit()
	get_parent().exit_minigames()
	end_minigame()
func update_rounds() -> void:
	$Rounds.text = str(get_parent().current_rounds) + "/" + str(get_parent().rounds)


func _on_button_mouse_entered() -> void:
	AudioManager.play_sfx($Button, on_hovered_sound)
