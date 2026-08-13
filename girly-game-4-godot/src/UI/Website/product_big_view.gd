extends VBoxContainer

@export var base_img : TextureRect
@export var tint_img : TextureRect
@export var top_img : TextureRect

@export var color_option : PackedScene
@export var colors : HBoxContainer
@export var image_bg : PanelContainer

#should probably use uid instead so that we can move around folders if needed
var current_product : Resource = load("res://src/Resources/Products/product4.tres")
var current_color_index : int = 0

@warning_ignore("unused_signal")
signal color_changed(index : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func get_state():
	return [current_product, current_color_index]


func setup(product : Product, index):
	current_product = product
	current_color_index = index
	image_bg.custom_minimum_size = Vector2(450,450)
	
	for rect in image_bg.get_children():
		rect.queue_free()
	
	var textures = product.get_texture_rect_list()
	for texture in textures:
		image_bg.add_child(texture)
	
	await get_tree().process_frame
	change_color(product, index)
	
	for color in colors.get_children():
		color.queue_free()
	
	for i in product.color_set1.size():
		add_button(product, i)


func add_button(product, index):
	var btn : Button = color_option.instantiate()
	btn.id = index
	
	var style : StyleBoxFlat = btn.get_theme_stylebox("normal").duplicate(true)
	style.bg_color = get_color_set(product, index)[0]
	style.border_color = get_color_set(product, index)[1]
	
	btn.add_theme_stylebox_override("normal", style)
	btn.pressed_id.connect(_on_color_option_presed)
	
	colors.add_child(btn)


func change_color(product : Product, index):
	
	print("start getting colored")
	current_color_index = index
	
	var color_count = product.get_texture_rect_list().size()
	
	for i in color_count:
		var texture : TextureRect = image_bg.get_child(i)
		
		if get_color_set(product, index).size() <= i:
			texture.modulate = product.default_color
			print("REDDDDDDDD")
			continue
		
		print("Colored SUCCESS")
		texture.modulate = get_color_set(product, index)[i]


func get_color_set(product : Product, index : int):
	match index:
		0:
			return product.color_set1
		1:
			return product.color_set2
		2:
			return product.color_set3


func _on_color_option_presed(index):
	if current_product == null:
		assert(false, "Current Product was NOT set aka is null")
	
	change_color(current_product, index)
