extends VBoxContainer

@export var image : TextureButton
@export var title : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func setup(product : Dictionary):
	title.text = product["name"]
	image.texture_normal = product["texture"]
