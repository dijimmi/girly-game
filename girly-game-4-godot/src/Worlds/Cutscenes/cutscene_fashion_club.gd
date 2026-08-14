@warning_ignore("missing_tool")
extends Cutscene

func _ready() -> void:
	animationPlayer.animation_finished.connect(_on_animation_finished)
	skipped = false
	
func _on_animation_finished(_anim : StringName) -> void:
	if skipped == false:
		Dialogic.start("scene3")
		can_skip = false

var skipped := false
var can_skip := true
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("dialogic_default_action") && !skipped && can_skip:
		Dialogic.start("scene3")
		skipped = true
		await get_tree().create_timer(1).timeout
		$AnimationPlayer.play("RESET")
