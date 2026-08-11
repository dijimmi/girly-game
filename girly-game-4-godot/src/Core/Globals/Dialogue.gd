extends Node
#Functions for dialogic
var minigames : Dictionary[String,PackedScene ]= {
	"drawing ": load("uid://c6ojot2ko0pnp")
} 

func start_minigame(word : String, rounds : int = 1, cue: String = "" ) -> void:
	var minigame_handler = MinigameHandler.new()
	minigame_handler.delete_on_finished = true
	minigame_handler.rounds = rounds
	minigame_handler.word_to_learn = word
	
	if cue == "":
		for scene in minigames.values():
			minigame_handler.add_child(scene.instantiate())
	else:
		var chosen_minigame = minigames[cue].instantiate()
		minigame_handler.add_child(chosen_minigame)
	
	add_child(minigame_handler)
	minigame_handler._start_minigames(word)
	print(get_tree()," ",get_tree().root)
func set_next_scene(cue : String) -> void:
	Global.next_scene = cue
	#print("changed next scene to ",cue," !")
