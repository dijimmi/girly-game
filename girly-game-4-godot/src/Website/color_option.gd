extends Button

@export var id : int

signal pressed_id(index)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_pressed() -> void:
	pressed_id.emit(id)
