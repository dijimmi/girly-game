extends DialogicBackground


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Dialogic.VAR.LEVEL == 1:
		$Hat.show()
		$Bow.hide()
	elif Dialogic.VAR.LEVEL == 2:
		$Bow.show()
		$Hat.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
