extends CanvasLayer


func _on_new_save_button_pressed() -> void:
	EventBus.load_scene.emit("scene1")
