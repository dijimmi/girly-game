extends Control

var difficulty : int = 0
var word_to_teach : String = ""

@export var on_skipped_sound : AudioStream = load("uid://dcxhhblaywrvd")
@export var correct_word : Array[AudioStream] = [
	load("uid://doi7ogbhahgqm"),
	load("uid://bphd57c1dudby"),
	load("uid://bmbt4yj8ul5q7"),
]


func start_minigame(meta : String) -> void:
	print("Draw start")
	if meta == "" or meta == null:
		return
	word_to_teach = meta
	difficulty = 0 #_calculate_difficulty()[get_parent().current_rounds]
	
	current_symbol = 0
	current_line = 0
	update_current_character()
	update_guide()
	self.show()

func end_minigame() -> void:
	update_guide("null")
	await get_tree().create_timer(0.5).timeout
	self.hide()
	$DrawingFrame.clear_frame()
	$DrawingFrame.clear_label()
	EventBus.minigame_round_end.emit()
	for letter in word_to_teach.rsplit():
		Global.add_player_exp(letter, 0.01)
func _calculate_difficulty() -> Array[int]:
	var result : Array[int] = []
	var instances : float = _get_instances()
	var player_level : float = _get_mid_exp(word_to_teach.rsplit())
	
	var _max : int = 2
	var _min : int = 0
	var count = 1
	
	if player_level <= 1.0/3.0:
		_max = 1
		count = 2
	elif player_level >= 2.0/3.0:
		_min = 1
		count = 5
	else:
		count = 3
	for i in instances:
		var step : int = round(i * count / 5)
		step = clamp(step, _min, _max)
		result.append(step)
	return result

func _get_instances() -> int:
	var result : int = 0
	for rounds in get_parent().minigame_order:
		if rounds == self:
			result += 1
	return result
func _get_mid_exp(letters : PackedStringArray) -> float:
	var result : float = 0.0
	var m : float = 0.0
	for letter in letters:
		m += Global.get_player_exp(letter)
	result = m / letters.size()
	return result

#_______-DIFFICULTY 0-_______#
var current_symbol : int = 0
var current_character  : String = ""
var current_line : int = 0
func verify_line() -> void:
	var current_letter = current_character
	var lines_dict = $DrawingFrame.hiragana_dictionary.find_key(current_letter)

	if $DrawingFrame.recognise_line():
		if current_line == lines_dict.size()-1:
			current_line = 0
			next_symbol()
		else:
			current_line += 1
			update_guide()
	else:
		var lines = get_tree().get_nodes_in_group("Lines")
		lines[-1].queue_free()
		$DrawingFrame.lines.pop_back()
func update_current_character(hint : String = ""):
	if current_symbol < word_to_teach.length():
		current_character = word_to_teach[current_symbol]
	if hint != "":
		current_character = hint

#______-DIFFICULTY 1-2-______#
func verify_symbol() -> void:
	if difficulty == 0:
		return 
	if $DrawingFrame.recognise_character():
		#await get_tree().create_timer(0.1).timeout
		AudioManager.play_random_sfx($DrawingFrame/Effects, correct_word)
		next_symbol()
	elif $DrawingFrame.recognise_character() == false:
		$DrawingFrame.clear_frame()
	elif $DrawingFrame.recognise_character() == null:
		return
func next_symbol() -> void:
	$DrawingFrame.clear_frame()
	$DrawingFrame.update_label(word_to_teach[current_symbol])
	current_symbol += 1
	update_current_character()
	if current_symbol >= word_to_teach.length():
		AudioManager.play_random_sfx($DrawingFrame/Effects,correct_word)
		end_minigame()
		return
	if word_to_teach[current_symbol] in $DrawingFrame.mini_hiragana_dictionary:
		update_current_character($DrawingFrame.mini_hiragana_dictionary[word_to_teach[current_symbol]])
	elif word_to_teach[current_symbol] in $DrawingFrame.dakuten_hiragana_dictionary:
		update_current_character($DrawingFrame.dakuten_hiragana_dictionary[word_to_teach[current_symbol]])
	elif word_to_teach[current_symbol] in $DrawingFrame.handakuten_hiragana_dictionary:
		update_current_character($DrawingFrame.handakuten_hiragana_dictionary[word_to_teach[current_symbol]])
	update_guide()
func update_guide(hint : String = "") -> void:
	update_rounds()
	update_instructions()
	var frames_dict : Dictionary = {}
	var current_letter : String
	var texture_rect = $DrawingFrame/TextureRect
	
	if current_symbol < word_to_teach.length():
		current_letter = word_to_teach[current_symbol]
	if hint != "":
		texture_rect.texture = Texture2D.new()
		return
		
	$DrawingFrame/TextureRectMini.texture = Texture2D.new()
	$DrawingFrame/TextureRect.texture = Texture2D.new()
	
	if word_to_teach[current_symbol] in $DrawingFrame.mini_hiragana_dictionary:
		texture_rect = $DrawingFrame/TextureRectMini
		current_letter = $DrawingFrame.mini_hiragana_dictionary[current_letter]
	elif word_to_teach[current_symbol] in $DrawingFrame.dakuten_hiragana_dictionary:
		current_letter = $DrawingFrame.dakuten_hiragana_dictionary[current_letter]
	elif word_to_teach[current_symbol] in $DrawingFrame.handakuten_hiragana_dictionary:
		current_letter = $DrawingFrame.handakuten_hiragana_dictionary[current_letter]
	if hint in frames_dict.keys():
		texture_rect.texture = frames_dict[hint]
		return
	
	if not current_letter in $DrawingFrame.hiragana_picture:
		return
	frames_dict = $DrawingFrame.hiragana_picture[current_letter].frames
	
	var frame : Texture2D = Texture2D.new()
	match difficulty:
		0:
			frame = frames_dict[str(current_line+1)]
		1:
			frame = frames_dict["full"]
	texture_rect.texture = frame
func update_instructions() -> void:
	$Instructions.text = word_to_teach
	$Instructions/Ratio.text = word_to_teach
	$Instructions/Ratio.visible_ratio = current_symbol / float(word_to_teach.length())
func update_rounds() -> void:
	$Rounds.text = str(get_parent().current_rounds) + "/" + str(get_parent().rounds)

func _on_exit_button_pressed() -> void:
	AudioManager.play_sfx($DrawingFrame/Stroke, on_skipped_sound)
	
	EventBus.minigame_skipped.emit()
	get_parent().exit_minigames()
	end_minigame()
