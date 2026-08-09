extends Control

var difficulty : int = 0

func _ready() -> void:
	print(_calculate_difficulty())
func start_minigame() -> void:
	#difficulty = _calculate_difficulty()
	self.show()

func end_minigame() -> void:
	self.hide()
	EventBus.minigame_round_end.emit()

func _calculate_difficulty() -> Array[int]:
	var result : Array[int] = []
	var instances : int = 5#_get_instances()
	for rounds in instances:
		print(int(rounds/instances))
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
