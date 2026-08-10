extends Control

@export var name_list : PanelContainer
var written_text : String = ""

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm"):
		if _is_name(written_text):
			Dialogic.VAR.PlayerName = written_text 
			EventBus.name_selected.emit()

func _on_name_prompt_text_changed(new_text: String) -> void:
	name_list.verify_match(new_text)
	written_text = new_text

func _is_name(cname : String) -> bool:
	for character in name_list.names:
		if character["name"] == cname:
			return true
	return false
