extends Node

var rounds : int = 5
var current_rounds : int = 0
var word_to_learn : String = ""

var minigame_order : Array[Control] = []

func _ready() -> void:
	EventBus.minigame_start.connect(_start_minigames)

func _start_minigames() -> void:
	current_rounds = 0
	_choose_minigame_order()
	for minigame in minigame_order:
		minigame.start_minigame()
		await EventBus.minigame_round_end
func _choose_minigame_order() -> void:
	minigame_order.clear()
	for i in rounds:
		var chosen_minigame = get_children().pick_random()
		minigame_order.append(chosen_minigame)
