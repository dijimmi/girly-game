extends Node

var score = 0

var glossary = Global.glossary

const FEATURED = "おすすめしょうひん"
const HOME = "home"
const SHOP_PAGE_SEARCH = "shop_page_search"
const FEATURED_PAGE = "featured_page"
const SHOP_PAGE_BUY = "shop_page_buy"
const HONSE = "honse"

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
	#hovered_text = hovered_text.strip_edges()
	
	var sample_dict = {
	"jp": hovered_text,
	"romaji": "bu-ra-n-do",
	"definition": "ERROR ERROR WORD NOT IN GLOSSARY"
	}
	
	print(glossary.entries.get(hovered_text, ""), "SHIMIMI YE SHIMI YE SHIMI YA")
	if "name" in glossary.entries.get(hovered_text, ""):
		sample_dict["jp"] = hovered_text
		sample_dict["romaji"] = glossary.entries[hovered_text]["alternatives"][0]
		sample_dict["definition"] = glossary.entries[hovered_text].get("title", "")
	
	return sample_dict


func update_word_details(hovered_text) -> void:
	var sample_dict = {
	"jp": hovered_text,
	"romaji": "bu-ra-n-do",
	"definition": "www you thought u had it unlocked? womp womp"
	}
	
	if "text" in glossary.entries[hovered_text]:
		sample_dict["jp"] = glossary.entries[hovered_text]["text"]
	else:
		sample_dict["jp"] = ""
	sample_dict["jp"] = glossary.entries[hovered_text]["name"]
	# I need romaji
	
	
	#if "extra" in glossary.entries[hovered_text] :
		#var examples : Array = glossary.entries[hovered_text]["extra"].rsplit("\n")
		#for i in examples.size():
			#if i < examples_Vbox.get_child_count():
				#examples_Vbox.get_child(i).text = "[ul]" + examples[i]


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
