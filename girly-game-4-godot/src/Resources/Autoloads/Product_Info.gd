extends Node

const FEATURED = "Featured Products"
const HOME = "home"
const SHOP_PAGE_SEARCH = "shop_page_search"
const FEATURED_PAGE = "featured_page"
const SHOP_PAGE_BUY = "shop_page_buy"

var products : Array[Product]
var meta_text = null


func make_clickable(node : RichTextLabel, text : String) -> String:
	if not node.meta_hover_started.is_connected(_on_meta_hover_started):
		node.meta_hover_started.connect(_on_meta_hover_started)
		node.meta_hover_ended.connect(_on_meta_hover_ended)
		node.gui_input.connect(_on_clickable_text_gui_input)
	
	return "[url=%s]%s[/url]" % [text, text]


func _on_clickable_text_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			# Check if the mouse is currently hovering over a meta item
			if meta_text != null:
				_on_meta_right_clicked(meta_text)


func _on_meta_right_clicked(meta: Variant) -> void:
	print("Right-clicked meta: ", meta)
	DisplayServer.clipboard_set(meta)


func _on_meta_hover_started(meta: Variant) -> void:
	meta_text = meta
	print('hovering')


func _on_meta_hover_ended(_meta: Variant) -> void:
	meta_text = null
