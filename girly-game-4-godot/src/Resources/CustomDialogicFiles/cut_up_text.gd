extends Node

@export var textbox : DialogicNode_DialogText
@export var dictionary : DialogicGlossary
@export var layer : DialogicLayoutLayer
var word_dictionary : Array

func _ready() -> void:
	assert(textbox != null, "CutUpText Node's textbox isn't set properly")
	assert(dictionary != null, "CutUpText Node's word_dictionary isn't set properly")
	assert(layer != null, "CutUpText Node's layer isn't set properly")
	textbox.finished_revealing_text.connect(_on_finished_text)
	textbox.started_revealing_text.connect(_on_start_text)
	textbox.meta_hover_started.connect(_on_meta_hovered_started)
	textbox.meta_hover_ended.connect(_on_meta_hovered_ended)
	textbox.meta_clicked.connect(_on_meta_clicked)
	
	word_dictionary = dictionary.entries.keys()
	
	text_color = layer.text_custom_color
	base_color = ProjectSettings.get_setting('dialogic/glossary/default_color')
	
	_reset_meta_colors(text_color)

func _on_finished_text() -> void:
	current_color = text_color
	_tween_meta_colors(base_color)
func _on_start_text() -> void:
	_reset_meta_colors(text_color)

func _on_meta_hovered_started(meta : Variant) -> void:
	current_color = base_color
	_tween_meta_colors(hover_color, meta)
func _on_meta_hovered_ended(meta : Variant) -> void:
	current_color = hover_color
	_tween_meta_colors(base_color, meta)
func _on_meta_clicked(meta : Variant) -> void:
	EventBus.minigame_start.emit(meta)

@export var hover_color : Color = Color(1.0, 1.0, 1.0, 1.0)
var text_color  : Color #text color
var base_color  : Color #glossary color
var current_color : Color
func _tween_meta_colors(col : Color, meta : Variant = null) -> void:
	var speed : float = 0.001
	
	var color_dif_r = abs(current_color.r - col.r)
	var color_dif_g = abs(current_color.g - col.g)
	var color_dif_b = abs(current_color.b - col.b)

	var total_time : float = 0.0
	while color_dif_r + color_dif_b + color_dif_g > 0.15:
		await get_tree().process_frame
		total_time += speed
		var new_color_r = lerpf(current_color.r, col.r, total_time)
		var new_color_g = lerpf(current_color.g, col.g, total_time)
		var new_color_b = lerpf(current_color.b, col.b, total_time)
		var new_color_step = Color(new_color_r,new_color_g,new_color_b,1).to_html(false)
		var new_color_str = "[color="+str(new_color_step)+"]"
		
		var regex = RegEx.new()
		if meta == null:
			regex.compile(r"\[color=[^\]]+\]")
			textbox.text = regex.sub(textbox.text, new_color_str, true)
		else:
			regex.compile("(\\[url=\"" + meta + "\"\\])\\[color=[^\\]]+\\]")
			textbox.text = regex.sub(textbox.text, "$1" + new_color_str, true)
		current_color = Color(new_color_r,new_color_g,new_color_b)
		color_dif_r = abs(current_color.r - col.r)
		color_dif_g = abs(current_color.g - col.g)
		color_dif_b = abs(current_color.b - col.b)
	#print(textbox.text)
func _reset_meta_colors(col : Color) -> void:
		var regex = RegEx.new()
		regex.compile(r"\[color=[^\]]+\]")
		
		var new_color = col.to_html(false)
		var new_color_str = "[color="+str(new_color)+"]"
		
		textbox.text = regex.sub(textbox.text, new_color_str, true)
