extends Node

var score = 0

const FEATURED = "お すすめ しょうひん"
const HOME = "home"
const SHOP_PAGE_SEARCH = "shop_page_search"
const FEATURED_PAGE = "featured_page"
const SHOP_PAGE_BUY = "shop_page_buy"

var products : Array[Product]
var meta_text = null
enum Level {ONE, TWO, THREE, FOUR}

func make_clickable(node : RichTextLabel, text : String) -> String:
	if not node.meta_hover_started.is_connected(_on_meta_hover_started.bind(node)):
		node.meta_hover_started.connect(_on_meta_hover_started.bind(node))
		node.meta_hover_ended.connect(_on_meta_hover_ended.bind(node))
		node.gui_input.connect(_on_clickable_text_gui_input.bind(node))
	
	return "[url=%s]%s[/url]" % [text, text]


func search_on_glossary(hovered_text) -> Dictionary:
	var sample_dict = {
	"jp": hovered_text,
	"romaji": "bu-ra-n-do",
	"definition": "www you thought u had it unlocked? womp womp"
	}
	return sample_dict


func _on_clickable_text_gui_input(event: InputEvent, node : RichTextLabel) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			# Check if the mouse is currently hovering over a meta item
			if meta_text != null:
				_on_meta_right_clicked(meta_text, node)


func _on_meta_right_clicked(meta: Variant, node : RichTextLabel) -> void:
	print("Right-clicked meta: ", meta)
	DisplayServer.clipboard_set(meta)


func _on_meta_hover_started(meta: Variant, node : RichTextLabel) -> void:
	meta_text = meta
	var dict = search_on_glossary(meta)
	
	var virtual_node = Tooltip.virtual_label
	virtual_node.text = node.text
	virtual_node.add_theme_font_size_override("font_size", node.get_theme_font_size("font_size_normal"))
	
	var parsed = virtual_node.text
	var char_index = parsed.find(str(meta))
	var local_rect = virtual_node.get_character_bounds(char_index)
	var global_pos = node.global_position + local_rect.position
	virtual_node.visible = false
	
	Tooltip.setup(dict, global_pos)


func _on_meta_hover_ended(_meta: Variant, node : RichTextLabel) -> void:
	meta_text = null
	
	Tooltip.hide_tooltip()
