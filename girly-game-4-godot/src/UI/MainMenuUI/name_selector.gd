extends Control

@export var name_list : PanelContainer
@export var confirmation_popup : CanvasLayer
@export var confirmation_label : RichTextLabel
@export var scene : PackedScene

var written_text : String = ""

func _ready() -> void:
	confirmation_popup.visible = false
	name_list.name_pressed_from_widget.connect(_on_name_pressed_from_widget)


func select_name():
	print("SUBMIT OR NOT SUBMIT")
	confirmation_label.text = "Submit name?\n%s" % written_text
	if not _is_name(written_text):
		confirmation_label.text += "\nIT'S NOT VOICED BY ANY CHARACTER"
	confirmation_popup.visible = true
	print(written_text)


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm"):
		select_name()


func _on_name_prompt_text_changed(new_text: String) -> void:
	name_list.verify_match(new_text)
	written_text = new_text


func _is_name(cname : String) -> bool:
	for character in name_list.names:
		if character["name"] == cname:
			return true
	return false


func _on_submit_pressed() -> void:
	get_tree().change_scene_to_packed(scene)
	#confirmation_popup.visible = false
	#Dialogic.VAR.PlayerName = written_text 
	#EventBus.name_selected.emit()


func _on_not_submit_pressed() -> void:
	confirmation_popup.visible = false


func _on_name_pressed_from_widget(cname):
	written_text = cname
	select_name()
