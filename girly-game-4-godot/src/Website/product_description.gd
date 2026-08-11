extends VBoxContainer

@export var product_name : Label
@export var product_description : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func setup(product):
	var dict = {
		"description": product.description,
		"collection": product.category,
		"substyle":product.substyle,
		"type": product.accesory_type,
	}
	
	var desc_template = "{description}\nCollection: {collection}\nSubstyle: {substyle}\nAccesory Type: {type}\n
	".format(dict)
	
	product_name.text = product.product_name
	product_description.text = desc_template
