@warning_ignore("missing_tool")
extends Cutscene

func _ready() -> void:
	animationPlayer.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(_anim : StringName) -> void:
	Dialogic.start("scene3")
