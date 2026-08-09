extends CanvasLayer

@export var name_in_popup : Label
@export var popup_panel : PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setup(name_str : String, voiced : bool):
	var text = "Voiced by: %s" % name_str
	if not voiced:
		text = "Not " + text
	name_in_popup.text = text
	

func move_to(pos):
	popup_panel.set_global_position(pos)

func get_size() -> Vector2:
	return popup_panel.size
