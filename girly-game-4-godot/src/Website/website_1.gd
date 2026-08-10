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
	toggle_undo_and_redo()


func view_product(dict, index = 0, from_redo = false):
	products_page.visible = false
	view_product_page.visible = true
	
	if not from_redo:
		stack.clear()
		stack_idx = 0
		stack.append([dict, index])
		
	product_big_view.setup(dict, index)
	
	print("normal view pressed: %s" % stack_idx)
	
	toggle_undo_and_redo()


func _on_color_changed(index):
	await get_tree().process_frame
	stack[stack_idx][1] = index


func _on_undo_pressed() -> void:
	stack_idx -= 1
	print("undo pressed: %s" % stack_idx)
	view_webpage()
	toggle_undo_and_redo()


func view_webpage():
	products_page.visible = true
	view_product_page.visible = false
	


func toggle_undo_and_redo():
	redo.disabled = stack_idx >= (stack.size() - 1)
	undo.disabled = stack_idx < 0


func _on_redo_pressed() -> void:
	stack_idx += 1
	print("redo pressed: %s" % stack_idx)
	if stack_idx < stack.size():
		
		var product = stack[stack_idx][0]
		var index = stack[stack_idx][1]

		view_product(product, index, true)
