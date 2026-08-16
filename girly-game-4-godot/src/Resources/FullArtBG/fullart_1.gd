extends DialogicBackground

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FA.change_fullart1.connect(change_expression)

func change_expression(expression):
	pass
