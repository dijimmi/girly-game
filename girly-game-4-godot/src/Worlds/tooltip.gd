extends CanvasLayer

@export var virtual_label : Label
@export var tooltip_bg : PanelContainer

@export_category("Labels")
@export var jp_word : RichTextLabel
@export var romaji_word : RichTextLabel
@export var word_definition : RichTextLabel


var mouse_on_tooltip = false

var sample_dict = {
	"jp": "ブランド",
	"romaji": "bu-ra-n-do",
	"definition": "www you thought u had it unlocked? womp womp"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func hide_tooltip():
	visible = false


func setup(dict, hovered_text_position : Vector2, make_visible : bool = true):
	jp_word.text = dict["jp"]
	romaji_word.text = dict["romaji"]
	word_definition.text = dict["definition"]
	
	visible = make_visible
	
	tooltip_bg.position = hovered_text_position
	tooltip_bg.position.y -= tooltip_bg.size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tooltip_mouse_entered() -> void:
	mouse_on_tooltip = true


func _on_tooltip_mouse_exited() -> void:
	mouse_on_tooltip = false
	hide_tooltip()
