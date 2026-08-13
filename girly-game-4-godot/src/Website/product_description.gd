extends VBoxContainer

@export var product_name : RichTextLabel
@export var product_description : RichTextLabel

var meta_text = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func setup(product):
	var description : String = product.description
	for word in product.description.split(" "):
		description = description.replace(word, ProductInfo.make_clickable(product_description, word))
	
	var dict = {
		"description": description,
		"collection": ProductInfo.make_clickable(product_description, product.category),
		"substyle": ProductInfo.make_clickable(product_description, product.substyle),
		"type": ProductInfo.make_clickable(product_description, product.accesory_type),
	}
	
	var desc_template = "{description}\nコレクション: {collection}\nけい: {substyle}\nアクセサリー タイプ: {type}\n
	".format(dict)
	
	var product_name_str : String = product.product_name
	for word in product.product_name.split(" "):
		product_name_str = product_name_str.replace(word, ProductInfo.make_clickable(product_name, word))
	
	product_name.text = product_name_str
	product_description.text = desc_template


func _on_product_categories_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			# Check if the mouse is currently hovering over a meta item
			if meta_text != null:
				_on_meta_right_clicked(meta_text)


func _on_meta_right_clicked(meta: Variant) -> void:
	print("Right-clicked meta: ", meta)
	DisplayServer.clipboard_set(meta)


func _on_product_categories_meta_hover_started(meta: Variant) -> void:
	meta_text = meta
	print('hovering')


func _on_product_categories_meta_hover_ended(meta: Variant) -> void:
	meta_text = null
