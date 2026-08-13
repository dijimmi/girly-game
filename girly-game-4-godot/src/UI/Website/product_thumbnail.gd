extends VBoxContainer

@export var title : RichTextLabel

@export var image_bg : PanelContainer

@export var base_img : TextureRect
@export var tint_img : TextureRect
@export var top_img : TextureRect

var product_dict
signal product_clicked(product)

var sizes = {
	"S" : [Vector2(100, 100), 16],
	"M" : [Vector2(250, 250), 24],
	"L" : [Vector2(400, 400), 32],
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func setup(product : Product, p_size):
	product_dict = product
	image_bg.custom_minimum_size = sizes[p_size][0]
	title.add_theme_font_size_override("normal_font_size", sizes[p_size][1])
	title.text = product.product_name
	
	var textures = product.get_texture_rect_list()
	
	for texture in textures:
		image_bg.add_child(texture)
	
	change_color(product)


func change_color(product):
	var color_count = image_bg.get_child_count()
	
	for i in color_count:
		var texture : TextureRect = image_bg.get_child(i)
		
		if get_color_set(product, 0).size() <= i:
			texture.modulate = product.default_color
			continue
		
		texture.modulate = product.color_set1[i]


func get_color_set(product : Product, index : int):
	match index:
		0:
			return product.color_set1
		1:
			return product.color_set2
		2:
			return product.color_set3


func _on_photo_pressed(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		product_clicked.emit(product_dict)
