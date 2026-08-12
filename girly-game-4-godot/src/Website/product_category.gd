extends VBoxContainer

@export var category : String
@export var category_name : RichTextLabel
@export var product_grid : GridContainer
@export var product_thumbnail : PackedScene

signal product_clicked_from_thumbnail(product : Resource)

var meta_text = null # used as a boolean where true is the value, and null is false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	if category != "":
		category_name.text = category
		if ProductInfo.FEATURED in category:
			category_name.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		else:
			category_name.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	add_all_products()


func add_all_products():
	for product in ProductInfo.products:
		if ProductInfo.FEATURED in category and product.featured:
			add_product(product)
			continue
			
		if product.category in category:
			add_product(product)


func get_products():
	var list = []
	for child in product_grid.get_children():
		list.append(child)
		
	return list


func add_product(product_res, p_size : String = "M"):
	var product = product_thumbnail.instantiate()
	product.setup(product_res, p_size)
	product_grid.add_child(product)
	product.product_clicked.connect(_on_product_clicked)


func _on_product_clicked(product : Resource):
	product_clicked_from_thumbnail.emit(product)


'''
HANDLING SIGNALS
''' 

func _on_category_name_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			# Check if the mouse is currently hovering over a meta item
			if meta_text != null:
				_on_meta_right_clicked(meta_text)


func _on_meta_right_clicked(meta: Variant) -> void:
	print("Right-clicked meta: ", meta)
	DisplayServer.clipboard_set(meta)


func _on_category_name_meta_hover_started(meta: Variant) -> void:
	meta_text = meta
	print('hovering')


func _on_category_name_meta_hover_ended(meta: Variant) -> void:
	meta_text = null
