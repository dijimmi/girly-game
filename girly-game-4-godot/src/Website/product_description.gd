extends VBoxContainer

@export var product_name : Label
@export var product_description : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func setup(product):
	product_name.text = product.product_name
	product_description.text = product.description
