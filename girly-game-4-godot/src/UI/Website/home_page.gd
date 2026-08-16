extends Control

@export var grid : GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func save_state(_page, _undo):
	pass


func load_state(_page, _undo):
	pass


func _on_big_view_toggled(toggled_on: bool) -> void:
	for child in grid.get_children():
		if child.name.begins_with("Game"):
			child.visible = toggled_on


func _on_game_thumbnail_1_pressed() -> void:
	if OS.has_feature("web"):
		JavaScriptBridge.eval("window.open('https://godotengine.org', '_blank').focus();")
	else:
		OS.shell_open("https://godotengine.org")
