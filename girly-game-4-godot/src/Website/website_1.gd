extends Control

@export var products_page : ScrollContainer
@export var view_product_page : HBoxContainer
@export var product_big_view : VBoxContainer

@export var undo : Button
@export var redo : Button

var stack_idx = -1

var stack = [
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	products_page.product_clicked_from_category.connect(view_product)
	product_big_view.color_changed.connect(_on_color_changed)


func view_product(dict, index = 0):
	
	products_page.visible = false
	view_product_page.visible = true
	
	product_big_view.setup(dict, index)
	stack.append([dict, index])
	stack_idx += 1


func _on_color_changed(index):
	await get_tree().process_frame
	stack[stack_idx][1] = index


func _on_undo_pressed() -> void:
	stack_idx -= 1
	view_webpage()


func view_webpage():
	products_page.visible = true
	view_product_page.visible = false


func _on_redo_pressed() -> void:
	stack_idx += 1
	if stack_idx < stack.size():
		var product = stack[stack_idx][0]
		var index = stack[stack_idx][1]

		view_product(product, index)
