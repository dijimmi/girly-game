class_name MinigameHandler extends CanvasLayer
@export var on_round_finished_sound : AudioStream = load("uid://rw3pxis8eg2c")
@export var on_finished_minigames_sount : AudioStream = load("uid://blytba7cx1ee1")
var rounds : int = 3
var current_rounds : int = 0
var word_to_learn : String = ""

var minigame_order : Array[Control] = []

var delete_on_finished : bool = false


func _ready() -> void:
	EventBus.minigame_start.connect(_start_minigames)

var minigame_skipped : bool = false
func _start_minigames(meta : String) -> void:
	current_rounds = 0

	_choose_minigame_order()
	for minigame in minigame_order:
		minigame.start_minigame(meta)
		await EventBus.minigame_round_end
		if minigame_skipped:
			return
		
		AudioManager.play_sfx(_get_audio_stream_player(), on_round_finished_sound)
		current_rounds += 1
	if !minigame_skipped:
		Global.unlock_word(meta)
		
	EventBus.minigame_end.emit()

func exit_minigames() -> void:
	minigame_skipped = true
	EventBus.minigame_end.emit()
var  skip_drawing : bool = false
var katakana_dict = Global.katakana_dict.basic_dictionary
func _choose_minigame_order() -> void:
	var banned_keys = katakana_dict.keys()
	if word_to_learn in banned_keys:
		skip_drawing = true
	minigame_order.clear()
	var minigames = []
	
	for child in get_children():
		if child is Control:
			if skip_drawing:
				if !child.is_in_group("DrawingMinigame"):
					minigames.append(child)
			else:
				minigames.append(child)
	for i in rounds:
		var chosen_minigame = minigames.pick_random()
		minigame_order.append(chosen_minigame)
func _get_audio_stream_player() -> AudioStreamPlayer:
	var asp : AudioStreamPlayer
	for child in get_children():
		if child is AudioStreamPlayer:
			asp = child
	return asp
