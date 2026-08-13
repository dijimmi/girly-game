extends Control

@export var scene_array: Dictionary[String, PackedScene]
@export var main_menu  : PackedScene

func _ready() -> void:
	assert(scene_array.size() != 0,"[level_handler] no scenes in scene_array")
	EventBus.load_scene.connect(_load_scene)
	Dialogic.timeline_ended.connect(_load_scene)

var cur_level
var cur_level_name
func _load_scene(cue : String = Global.next_scene):
	if !(cue in scene_array.keys()):
		print("[level_handler] ",cue," isn't in the scene_array : ",scene_array.keys())
		return
	if cur_level: cur_level.queue_free()
	var level = scene_array[cue].instantiate()
	cur_level = level
	cur_level_name = cue
	add_child(level)
	#AudioHandler.play_or_resume_music()
