extends ScrollContainer

@export var products_list : VBoxContainer
@export var category_scene : PackedScene

signal product_clicked_from_category(product)

var categories_names = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	
	add_category(ProductInfo.FEATURED)
	
	for product in ProductInfo.products:
		if not product.category in categories_names:
			categories_names.append(product.category)
			add_category(product.category)


func _on_product_clicked_from_thumbnail(product):
	product_clicked_from_category.emit(product)


func add_category(_name):
	var new_cat = category_scene.instantiate()
	new_cat.category = "[url=%s]%s[/url]" % [_name, _name]
	new_cat.product_clicked_from_thumbnail.connect(_on_product_clicked_from_thumbnail)
	products_list.add_child(new_cat)
