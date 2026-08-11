extends PanelContainer

@export var search_bar : LineEdit
@export var products_list : ScrollContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_search_prompted(text : String):
	text = text.strip_edges().to_lower()
	products_list.hide_all_products()
	
	if text == "":
		products_list.show_all_products()
		return
	
	var list = products_list.get_all_products()
	
	for product in list:
		for keyword : String in product.product_dict.get_keywords():
			if keyword.to_lower().contains(text):
				product.visible = true
				print("SHOW IT")
				break


func _on_search_bar_text_submitted(new_text: String) -> void:
	_on_search_prompted(new_text)


func _on_search_button_pressed() -> void:
	_on_search_prompted(search_bar.text)


func _on_search_bar_text_changed(new_text: String) -> void:
	_on_search_prompted(new_text)
