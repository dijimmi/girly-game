extends ScrollContainer

@export var products_list : VBoxContainer

signal product_clicked_from_category(dict)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for category in products_list.get_children():
		category.product_clicked_from_thumbnail.connect(_on_product_clicked_from_thumbnail)

func _on_product_clicked_from_thumbnail(dict):
	product_clicked_from_category.emit(dict)
