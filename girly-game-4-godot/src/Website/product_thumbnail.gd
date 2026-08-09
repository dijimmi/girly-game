extends VBoxContainer

@export var image : TextureButton
@export var title : RichTextLabel

var product_dict : Dictionary = {}
signal product_clicked(dict : Dictionary)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func setup(product : Dictionary):
	product_dict = product
	
	title.text = product["name"]
	image.texture_normal = product["texture"]


func _on_image_pressed() -> void:
	if product_dict.is_empty():
		assert(false, "Product Dictionary is empty for product with title: %s" % title.text)
	
	product_clicked.emit(product_dict)
