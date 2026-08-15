extends Control

@onready var volume_slider = $ColorRect/GridContainer/VolumeHSlider
@onready var music_slider = $ColorRect/GridContainer/MusicHSlider
@onready var sfx_slider = $ColorRect/GridContainer/SoundEffectsHSlider

func _ready() -> void:
	var indx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(indx, volume_slider.value)
	indx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(indx, music_slider.value)
	indx = AudioServer.get_bus_index("SoundEffects")
	AudioServer.set_bus_volume_db(indx, sfx_slider.value)
	
	var a = "ッつ"
	var glos = load("res://src/Resources/DialogicCustomFiles/glossary_words.tres")
	print(a in glos.entries, print, glos.entries.keys())

func _on_back_button_pressed() -> void:
	hide()

func _on_volume_h_slider_value_changed(value: float) -> void:
	var indx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(indx, value)
func _on_voices_h_slider_2_value_changed(value: float) -> void:
	var indx = AudioServer.get_bus_index("Voices")
	AudioServer.set_bus_volume_db(indx, value)
func _on_music_h_slider_value_changed(value: float) -> void:
	var indx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(indx, value)
func _on_sound_effects_h_slider_value_changed(value: float) -> void:
	var indx = AudioServer.get_bus_index("SoundEffects")
	AudioServer.set_bus_volume_db(indx, value)
