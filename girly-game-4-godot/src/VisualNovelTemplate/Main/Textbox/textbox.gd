class_name VNTextBox
extends Control

@export var character_name_label: CharacterNameLabel
@export var story_text_label: StoryText
@export var arrow: TextureRect
var arrow_tween : Tween
var init_arrow_pos : float

signal continued_story

func _ready() -> void:
	await get_tree().process_frame
	init_arrow_pos = arrow.global_position.x
	story_text_label.text_completed.connect(animate_arrow)


func setup(character_name : String, story_text : String):
	arrow.hide()
	if arrow_tween and arrow_tween.is_valid():
		arrow_tween.kill()
	
	character_name_label.setup(character_name)
	story_text_label.setup(story_text)


func animate_arrow():
	arrow.show()
	var dur = 0.5
	var pos = init_arrow_pos
	arrow_tween = create_tween().set_loops()
	
	arrow_tween.tween_property(arrow, "global_position:x", pos - 10, dur)
	arrow_tween.tween_property(arrow, "global_position:x", pos,      dur)


func _on_button_pressed():
	continued_story.emit()
