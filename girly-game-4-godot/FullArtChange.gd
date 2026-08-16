extends Node

signal showing_full_art(i : int)
func show_full_art(i : int) -> void:
	showing_full_art.emit(i)
