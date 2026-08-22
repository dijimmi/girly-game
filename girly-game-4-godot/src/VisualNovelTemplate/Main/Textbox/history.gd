class_name StoryHistory
extends CanvasLayer

@export var messages_list: VBoxContainer
@export var history: RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func setup(c_name : String, message : String) -> void:
	var text
	if c_name.strip_edges().is_empty():
		text = message
	else:
		text = "%s: %s" % [c_name, message]
		
	var msg = history.duplicate()
	msg.text = text
	messages_list.add_child(msg)


func delete_last_message():
	var msg_count = messages_list.get_children().size()
	if msg_count > 2:
		messages_list.get_child(msg_count - 1).queue_free()
		messages_list.get_child(msg_count - 2).queue_free()
