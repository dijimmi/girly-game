extends Control

@export var level_handler : Node

func _ready():
	hide()
	level_handler = get_tree().root.get_node("Game/LevelHandler")

func open_level_selector():
	show()
	if !level_handler:
		return
	for scene in level_handler.scene_array.keys():
		var new_button := Button.new()
		new_button.text = scene
		$GridContainer.add_child(new_button)
		new_button.pressed.connect(func ():
			EventBus.load_scene.emit(scene))

func _on_back_button_pressed() -> void:
	hide()
