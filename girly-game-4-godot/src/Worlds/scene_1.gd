extends Node2D

@export var timeline_name : String = "scene1_narration"

func _ready() -> void:
	assert(timeline_name != "", str(self.name)+"'s timeline name isn't set properly")
	EventBus.name_selected.connect(_on_name_selected)
	Dialogic.start(timeline_name)
	get_tree().paused = true
	$CanvasLayer.visible = true
	Global.can_pause = false

func _on_name_selected() -> void:
	print("name selected")
	$CanvasLayer.visible = false
	get_tree().paused = false
	Global.can_pause = true
