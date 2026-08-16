extends Control

@export var search_bar : LineEdit
@export var shop_page : ShopPage

signal pressed_logo_from_search_bar
signal search_prompted(text)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_search_prompted(text : String):
	search_prompted.emit(text)


func _on_search_bar_text_submitted(new_text: String) -> void:
	_on_search_prompted(new_text)


func _on_search_button_pressed() -> void:
	_on_search_prompted(search_bar.text)


func _on_website_logo_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			pressed_logo_from_search_bar.emit()

@warning_ignore("unused_parameter")
func _on_search_bar_text_changed(new_text: String) -> void:
	#_on_search_prompted(new_text)
	pass
