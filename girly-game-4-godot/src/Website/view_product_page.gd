class_name ViewProductPage
extends HBoxContainer

@export var buy_popup : CanvasLayer
@export var product_big_view : VBoxContainer
@export var product_info : VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func get_state():
	return product_big_view.get_state()


func setup_page(product, index = 0):
	product_big_view.setup(product, index)
	product_info.setup(product)


func _on_buy_button_pressed() -> void:
	buy_popup.visible = true


func _on_yes_pressed() -> void:
	print("YOU BOUGHT THE THINGY :D")
	assert(false, "Yet to implement transition after buying")


func _on_no_pressed() -> void:
	buy_popup.visible = false
