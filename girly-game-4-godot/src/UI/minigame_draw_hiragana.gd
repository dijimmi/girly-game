extends Control

var difficulty : int = 0
var word_to_teach : String = ""

func start_minigame(meta : String) -> void:
	if meta == "" or meta == null:
		return
	word_to_teach = meta
	difficulty = _calculate_difficulty()[get_parent().current_rounds]
	update_guide()
	self.show()

func end_minigame() -> void:
	self.hide()
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
var current_line : int = 0
func verify_line(line : String) -> void:
	var current_letter = word_to_teach[current_symbol]
	var lines_dict = $DrawingFrame.hiragana_dictionary.find_key(current_letter)
	
	print(line, lines_dict[current_line])
	if line == lines_dict[current_line]:
		print(current_line,  lines_dict.size()-1)
		if current_line == lines_dict.size()-1:
			current_line = 0
			next_symbol()
			update_guide()
		else:
			current_line += 1
			update_guide()
	else:

		var lines = get_tree().get_nodes_in_group("Lines")
		lines[-1].queue_free()
		$DrawingFrame.lines.pop_back()
#______-DIFFICULTY 1-2-______#
func verify_symbol(symbol : String) -> bool:
	var result : bool = false
	var current_letter = word_to_teach[current_symbol]
	if symbol == current_letter:
		result = true
		await get_tree().create_timer(1).timeout
		next_symbol()
	return result
func next_symbol() -> void:
	current_symbol += 1
	$DrawingFrame.clear_frame()
	if current_symbol >= word_to_teach.length():
		end_minigame()
func update_guide() -> void:
	var frame : Texture2D = Texture2D.new()
	var current_letter = word_to_teach[current_symbol]
	var frames_dict = $DrawingFrame.hiragana_picture[current_letter].frames
	match difficulty:
		0:
			frame = frames_dict[str(current_line+1)]
		1:
			frame = frames_dict["full"]
	$DrawingFrame/TextureRect.texture = frame
