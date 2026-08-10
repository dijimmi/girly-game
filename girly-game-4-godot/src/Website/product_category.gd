extends VBoxContainer

@export var category : String
@export var category_name : Label
@export var product_grid : GridContainer
@export var product_thumbnail : PackedScene

signal product_clicked_from_thumbnail(product : Resource)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	category_name.text = category
	add_all_products()


func add_all_products():
	for product in ProductInfo.products:
		if category == ProductInfo.FEATURED and product.featured:
			add_product(product)
			continue
			
		if product.category == category:
			add_product(product)


func add_product(product_res):
	var product = product_thumbnail.instantiate()
	product.setup(product_res)
	product_grid.add_child(product)
	product.product_clicked.connect(_on_product_clicked)


func _on_product_clicked(product : Resource):
	product_clicked_from_thumbnail.emit(product)
