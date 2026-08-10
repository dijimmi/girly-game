extends Control

@export var shop_page : PanelContainer
@export var shop_page_seach_bar : PanelContainer

@export var products_page : ScrollContainer
@export var view_product_page : HBoxContainer
@export var product_big_view : VBoxContainer
@export var homepage : PanelContainer

@export var undo : Button
@export var redo : Button

var stack_idx = -1

var stack = [
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_products()
	
	products_page.product_clicked_from_category.connect(view_product)
	product_big_view.color_changed.connect(_on_color_changed)
	toggle_undo_and_redo()


func init_products():
	const path = "res://src/Resources/Products/"
	
	var files = DirAccess.get_files_at(path)
	for file_name in files:
		var loaded_product = load(path + file_name)
		ProductInfo.products.append(loaded_product)


func view_product(dict, index = 0, from_redo = false):
	view_product_page.visible = true
	
	products_page.visible = false
	shop_page_seach_bar.visible = false
	
	if not from_redo:
		stack.clear()
		stack_idx = 0
		stack.append([dict, index])
		
	view_product_page.setup_page(dict, index)
	
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
	shop_page.visible = true
	products_page.visible = true
	shop_page_seach_bar.visible = true
	
	view_product_page.visible = false
	homepage.visible = false


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


func _on_website_1_pressed() -> void:
	view_webpage()


func _on_home_pressed() -> void:
	homepage.visible = true
	shop_page.visible = false
	shop_page_seach_bar.visible = false
