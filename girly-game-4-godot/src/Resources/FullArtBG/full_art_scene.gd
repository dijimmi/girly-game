extends Control


func _ready() -> void:
	FullArtChange.showing_full_art.connect(change_full_art)

func change_full_art(i : int):
	match i:
		1:
			$Art1.show()
			$Art2.hide()
			$Art3.hide()
		2:
			$Art2.show()
			$Art1.hide()
			$Art3.hide()
		3:
			
