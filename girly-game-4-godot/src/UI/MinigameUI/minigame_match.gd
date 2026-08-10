extends Control


func start_minigame() -> void:
	self.show()

func end_minigame() -> void:
	self.hide()
	EventBus.minigame_round_end.emit()
