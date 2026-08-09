extends Control

@export var name_list : PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_name_prompt_text_changed(new_text: String) -> void:
	name_list.verify_match(new_text)
