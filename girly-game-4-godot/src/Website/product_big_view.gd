extends VBoxContainer

@export var base_img : TextureRect
@export var tint_img : TextureRect
@export var top_img : TextureRect

@export var color_option : PackedScene
@export var colors : HBoxContainer

var current_product : Resource
var current_color_index : int = 0

signal color_changed(index : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func setup(product, index):
	current_product = product
	
	base_img.texture = product.base_texture
	tint_img.texture = product.tint_texture
	top_img.texture = product.top_texture
	
	change_color(product, index)
	
	for color in colors.get_children():
		color.queue_free()
	
	for i in product.base_colors.size():
		add_button(product, i)


func add_button(product, index):
	var btn : Button = color_option.instantiate()
	btn.id = index
	
	var style : StyleBoxFlat = btn.get_theme_stylebox("normal").duplicate(true)
	style.bg_color = product.tint_colors[index]
	style.border_color = product.base_colors[index]
	
	btn.add_theme_stylebox_override("normal", style)
	btn.pressed_id.connect(_on_color_option_presed)
	
	colors.add_child(btn)


func change_color(product, index):
	current_color_index = index
	color_changed.emit(index)
	
	base_img.modulate = product.base_colors[index]
	tint_img.modulate = product.tint_colors[index]
	top_img.modulate = product.top_colors[index]


func _on_color_option_presed(index):
	if current_product == null:
		assert(false, "Current Product was NOT set aka is null")
	
	change_color(current_product, index)
