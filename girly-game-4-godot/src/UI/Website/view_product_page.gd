class_name ViewProductPage
extends HBoxContainer

@export var buy_popup : CanvasLayer
@export var product_big_view : VBoxContainer
@export var product_info : VBoxContainer

var curr_product : Product

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func get_state():
	return product_big_view.get_state()


func setup_page(product, index = 0):
	curr_product = product
	
	product_big_view.setup(product, index)
	product_info.setup(product)


func _on_buy_button_pressed() -> void:
	buy_popup.visible = true


func _on_yes_pressed() -> void:
	print("YOU BOUGHT THE THINGY :D")
	if curr_product.winner:
		$Outcome.play()
	else:
		$Outcome2.play()


func _on_no_pressed() -> void:
	buy_popup.visible = false
