@warning_ignore("missing_tool")
extends Cutscene


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("dialogic_default_action"):
		EventBus.load_scene.emit("main menu")
		set_process_input(false)
		self.hide()
