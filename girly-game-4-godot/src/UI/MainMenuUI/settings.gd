extends Control

@onready var volume_slider = $ColorRect/GridContainer/VolumeHSlider
@onready var music_slider = $ColorRect/GridContainer/MusicHSlider
@onready var sfx_slider = $ColorRect/GridContainer/SoundEffectsHSlider

@export var font : FontFile
@export var simple_font : FontFile

func _ready() -> void:
	Global.font_to_use = font
	theme_.set_font("font", "Button", font)
	theme_.set_font("font", "Label", font)
	theme_.set_font("normal_font", "RichTextLabel", font)
	
	var indx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(indx, volume_slider.value)
	indx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(indx, music_slider.value)
	indx = AudioServer.get_bus_index("SoundEffects")
	AudioServer.set_bus_volume_db(indx, sfx_slider.value)
	
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

var theme_ = load("uid://bpcan81im5njq")
func _on_check_box_toggled(toggled_on: bool) -> void:
	var font_string

	if toggled_on:
		font_string = simple_font
	else:
		font_string = font

	print(theme.get_theme_item_type_list(Theme.DATA_TYPE_FONT))
	
	theme_.set_font("font", "Button", font_string)
	theme_.set_font("font", "Label", font_string)
	theme_.set_font("normal_font", "RichTextLabel", font_string)
	Global.font_to_use = font_string

	
