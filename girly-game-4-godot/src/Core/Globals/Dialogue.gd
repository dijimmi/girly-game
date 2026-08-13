extends Node
#Functions for dialogic
var minigames : Dictionary[String,PackedScene ]= {
	"drawing ": load("uid://c6ojot2ko0pnp")
} 

func start_minigame(word : String, rounds : int = 1, minigame: String = "" ) -> void:
	
	var minigame_handler = MinigameHandler.new()
	minigame_handler.layer = 98
	minigame_handler.delete_on_finished = true
	minigame_handler.rounds = rounds
	minigame_handler.word_to_learn = word
	minigame_handler.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	
	if minigame == "":
		for scene in minigames.values():
			minigame_handler.add_child(scene.instantiate())
	else:
		var chosen_minigame = minigames[minigame].instantiate()
		minigame_handler.add_child(chosen_minigame)
	
	
	add_child(minigame_handler)
	minigame_handler._start_minigames(word)
	EventBus.minigame_end.connect(func (): get_tree().paused = false)
	get_tree().paused = true
func open_dictionary() -> void:
	pass
func set_next_scene(cue : String) -> void:
	Global.next_scene = cue
	#print("changed next scene to ",cue," !")
