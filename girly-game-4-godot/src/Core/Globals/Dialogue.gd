extends Node
#Functions for dialogic
var minigames : Dictionary[String,PackedScene ]= {
	"drawing ": load("uid://c6ojot2ko0pnp"),
	"match"   : load("uid://d4k7pnnfsyxn")
} 

func start_minigame(word : String, _rounds : int = 1, minigame: String = "" ) -> void:
	var minigames_available = minigames.duplicate(true)
	if word[0] in Global.katakana_dict:
		minigames_available.erase("match")
	
	var minigame_handler = MinigameHandler.new()
	minigame_handler.layer = 98
	minigame_handler.delete_on_finished = true
	#minigame_handler.rounds = _rounds
	minigame_handler.word_to_learn = word
	minigame_handler.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	
	if minigame == "":
		for scene in minigames_available.values():
			var new_scene = scene.instantiate()
			minigame_handler.add_child(new_scene)
			new_scene.hide()
	else:
		var chosen_minigame = minigames_available[minigame].instantiate()
		minigame_handler.add_child(chosen_minigame)
		chosen_minigame.hide()
	
	add_child(minigame_handler)
	minigame_handler._start_minigames(word)
	EventBus.minigame_end.connect(func (): get_tree().paused = false)
	get_tree().paused = true

func set_next_scene(cue : String) -> void:
	Global.next_scene = cue
	#print("changed next scene to ",cue," !")
