extends CanvasLayer
#main menu

func _on_new_save_button_pressed() -> void:
	EventBus.load_scene.emit("scene1")

func _on_playtest_button_pressed() -> void:
	EventBus.load_scene.emit("website1")
