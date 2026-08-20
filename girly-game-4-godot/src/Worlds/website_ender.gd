extends Control

var level : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = Dialogic.VAR.LEVEL
	
	if level == 0:
		Dialogic.start("scene5_DONE")
	elif level == 1:
		Dialogic.start("scene6_DONE")
	elif level == 2:
		Dialogic.start("scene8_DONE")
	else:
		Dialogic.start("scene2_DONE")
