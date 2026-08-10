extends VBoxContainer

@export var title : RichTextLabel

@export var base_img : TextureRect
@export var tint_img : TextureRect
@export var top_img : TextureRect

var product_dict
signal product_clicked(product)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func setup(product):
	product_dict = product
	
	title.text = product.product_name
	base_img.texture = product.base_texture
	tint_img.texture = product.tint_texture
	top_img.texture = product.top_texture
	
	change_color(product)


func change_color(product):
	base_img.modulate = product.base_colors[0]
	tint_img.modulate = product.tint_colors[0]
	top_img.modulate = product.top_colors[0]


func _on_photo_pressed(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		product_clicked.emit(product_dict)
		
