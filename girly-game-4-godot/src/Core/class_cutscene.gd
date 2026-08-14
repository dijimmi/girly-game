@tool
class_name Cutscene extends Control

@export var animationPlayer : AnimationPlayer = null
 
func _get_configuration_warnings() -> PackedStringArray:
	var warnings : PackedStringArray = []
	if get_child_count() < 1:
		warnings.append("Cutscene must have at least 1 AnimationPlayer child")
	else:
		var animation_player: bool = false
		for child in get_children():
			if child.is_class("AnimationPlayer"):
				animationPlayer = child
				animation_player = true
		if !animation_player:
			animationPlayer = null
			warnings.append("Cutscene must have at least 1 AnimationPlayer amongst children")
	return warnings
