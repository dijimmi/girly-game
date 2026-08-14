@tool
extends DialogicPortrait

#custom dialogue
enum Faces {NEUTRAL, HAPPY, SMILE, CONFUSED, LAUGH, WORRIED, EXCITED}

@export_group('Main')
@export_file var body_image := ""
@export_file var expression_image := ""

@export var emotion: Faces = Faces.NEUTRAL
@export var portrait_width: int
@export var portrait_height: int

var does_custom_portrait_change := true


# This function can be overridden. Defaults to true, if not overridden!
func _should_do_portrait_update(_character: DialogicCharacter, _portrait:String) -> bool:
	return true
func _ready() -> void:
	$Faces/Neutral.texture = load(expression_image)

signal _change_expression
func _call_change_expression():
	_change_expression.emit()
# If the custom portrait accepts a change, then accept it here
func _update_portrait(_passed_character: DialogicCharacter, _passed_portrait: String) -> void:
	$AnimationPlayer.play("change_sprite")
	$Body.texture = load(body_image)
	await _change_expression
	for face in $Faces.get_children():
		face.hide()
	if emotion == Faces.NEUTRAL:
		$Faces/Neutral.texture = load(expression_image)
		$Faces/Neutral.show()
	elif emotion == Faces.HAPPY: 
		$Faces/Happy.texture = load(expression_image)
		$Faces/Happy.show()
	elif emotion == Faces.SMILE: 
		$Faces/Smile.texture = load(expression_image)
		$Faces/Smile.show()
	elif emotion == Faces.CONFUSED: 
		$Faces/Confused.texture = load(expression_image)
		$Faces/Confused.show()
	elif emotion == Faces.LAUGH: 
		$Faces/Laugh.texture = load(expression_image)
		$Faces/Laugh.show()
	elif emotion == Faces.WORRIED: 
		$Faces/Worried.texture = load(expression_image)
		$Faces/Worried.show()
	elif emotion == Faces.EXCITED: 
		$Faces/Excited.texture = load(expression_image)
		$Faces/Excited.show()
func _set_mirror(is_mirrored: bool) -> void:
	print(is_mirrored)
	if is_mirrored:
		self.scale.x = -1

	else:
		self.scale.x = 1


## If implemented, this is used by the editor for the "full view" mode
func _get_covered_rect() -> Rect2:
	# This will focus on the face.
	# return Rect2($Faces/Anger.position+$Faces.position, $Faces/Anger.get_rect().size*$Faces/Anger.scale*$Faces.scale)
	var size: Vector2 = $Body.get_rect().size
	var scaled_size: Vector2 = size * $Body.scale
	var position: Vector2 = $Body.position

	return Rect2(position, scaled_size)
