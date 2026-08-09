extends Control

@export var products_page : ScrollContainer
@export var view_product_page : HBoxContainer
@export var product_big_view : VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	products_page.product_clicked_from_category.connect(view_product)


func view_product(dict):
	products_page.visible = false
	view_product_page.visible = true
	
	product_big_view.setup(dict)
