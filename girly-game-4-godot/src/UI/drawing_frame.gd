class_name DrawingFrame extends Control

@export_category("Characters")
@export var hiragana_dictionary : Dictionary = {
	["horizontal", "vertical", "curved2"] : "あ",
	["horizontal", "vertical", "curved3"] : "あ",
	["curved2", "vertical", "vertical"] : "か",
	["curved1", "vertical", "vertical"] : "か",
	["horizontal", "curved1", "horizontal"]  : "さ",
	["horizontal", "curved1", "curved1"]     : "さ",
	["horizontal", "vertical", "horizontal"] : "さ",
	["horizontal", "vertical", "horizontal"] : "さ",
	["horizontal", "vertical", "horizontal", "horizontal"] : "た",
	["horizontal", "vertical", "horizontal", "curved1"]    : "た",
	#["horizontal", "vertical", "horizontal", "curved1"] : "な", #SAME AS た NEEDS MORE DETAIL
	["horizontal", "vertical", "curved1", "curved1"]    : "な",
	["curved1", "horizontal", "curved2"]  : "は",
	["vertical", "horizontal", "curved2"] : "は",
	#["horizontal", "horizontal", "curved2"] : "ま", #NEEDS MORE DETAIL
	["vertical", "curved1", "vertical"]   : "や",
	["vertical", "curved1", "horizontal"] : "や",
	#["horizontal", "curved2"] : "ら",
	["vertical", "curved4"] : "わ", 
	
	["curved1", "vertical"] : "い",
	["vertical", "vertical"] : "い",
	["horizontal", "horizontal", "curved1", "curved1"] : "き",
	["horizontal", "horizontal", "curved1", "horizontal"] : "き",
	["horizontal", "horizontal", "vertical", "curved1"] : "き",
	["horizontal", "horizontal", "vertical", "horizontal"] : "き",
	#["curved1", "left"] : "し" # NEEDS MORE DETAIL
	#["curved1"] : "つ"
	#["horizontal", "curved5"] : "ぬ",
	#["horizontal", "curved4"] : "ぬ",
	#["vertical", "curved5"]   : "ぬ",
	#["vertical", "curved4"]   : "ぬ",
	#["curved1", "curved5"]    : "ぬ",
	#["curved1", "curved4"]    : "ぬ",
	["curved1", "curved1", "vertical", "horizontal"] : "ふ",
	["horizontal", "curved4", "horizontal"] : "む",
	["curved3", "vertical"] : "ゆ",
	["curved4", "vertical"] : "ゆ",
	#["curved4"] : "る",
	#["curved5"] : "る",
	#["horizontal", "curved3"] : "え",
	#["horizontal", "curved"]  : "え",
	["curved1", "horizontal","vertical"] : "け",
	["horizontal", "vertical", "curved1"]  : "せ",
	#["curved2"] : "て",
	#["vertical", "curved5"] : "ね",
	#["vertical", "curved6"] : "ね",
	#["curved1"] : "へ",
	#["vertical", "curved3"] : "め",
	#["vertical", "curved4"] : "め",
	#["vertical", "curved4"] : "れ",
	["horizontal", "curved3", "horizontal"] : "お",
	["horizontal", "horizontal"] : "こ",
	["horizontal", "curved1"]    : "こ",
	["curved4"] : "そ",
	["vertical", "curved1"]   : "と",
	["horizontal", "curved1"] : "と",
	#["curved4"] : "の",
	#["curved3"] : "の",
	["curved1", "horizontal", "horizontal", "curved2"] : "ほ",
	#["horizontal", "horizontal", "curved1"] : "も",
	#["horizontal", "horizontal", "curved2"] : "も",
	["curved2", "horizontal"] : "よ",
	#["curved3"] : "ろ",
	["horizontal", "curved2", "curve1"] : "を",
	["curved3"] : "ん"
}
@export var label : Label
@export_category("Drawing")
@export var max_point_distance : float = 5.5

func _ready() -> void:
	$Delay.timeout.connect(_recognise_symbol)

#________________-DRAWING-________________#
var mouse_pos : Vector2 = Vector2.ZERO
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && Input.is_action_pressed("draw"):
			mouse_pos = event.position
			_draw_new_line()
			$Delay.start()
	elif event.is_action_released("draw"):
		_detect_current_line_shape()
		current_line = null

var lines : Array = []
var current_line : Line2D = null
func _draw_new_line() -> void:
	if current_line == null:
		current_line = Line2D.new()
		current_line.default_color = Color(0,0,0)
		add_child(current_line)
	
	if current_line.points.size()-1 == -1:
		current_line.add_point(mouse_pos)
	else:
		var last_pi = current_line.get_point_count()-1
		if mouse_pos.distance_to(current_line.get_point_position(last_pi)) < max_point_distance:
			current_line.set_point_position(last_pi, mouse_pos)
		else:
			current_line.add_point(mouse_pos)
		
		#detect if the rect of this point+last point is overlaping with any other stroke's rect
		#if it's overlaping with a stroke's rect keep
	#get the first point's position
	#go through every point and add their direction from first point's position
	#if the total curve is higher than idk 180 then add a curve point (latest point)
	#reset total curve and follow that point's position now

var curve_points : Array = []
var total_curve : float = 0.0
var ref_i := 0
func _detect_curve_points() -> String:
	var result : String = ""
	curve_points.clear()
	total_curve = 0.0
	ref_i = 0
	
	for point_i in current_line.points.size():
		if point_i > ref_i:
			
			var first_point_i = point_i
			var first_point = current_line.get_point_position(first_point_i)
			
			var second_point_i = clampi(current_line.points.find(first_point)+5,0, current_line.get_point_count()-1)
			var second_point = current_line.get_point_position(second_point_i)
			
			var third_point_i = clampi(current_line.points.find(first_point)+20, 0, current_line.get_point_count()-1)
			var third_point = current_line.get_point_position(third_point_i)

			var short_vec = first_point.direction_to(second_point)
			var long_vec = first_point.direction_to(third_point)
			total_curve += short_vec.cross(long_vec)
			if abs(short_vec.cross(long_vec)) > 0.4:
				curve_points.append(second_point)
				_mark_point(first_point,1)
				_mark_point(second_point,2)
				_mark_point(third_point,3)
				ref_i = third_point_i
	if curve_points.size() == 0:
		result = _h_or_v()
	else:
		result = "curved" + str(curve_points.size())
	return result

func _h_or_v() -> String:
	var result : String = ""
	
	var first_point : Vector2 = current_line.points[0]
	var last_point  : Vector2 = current_line.points[current_line.get_point_count()-1]
	
	var direction : Vector2 = first_point.direction_to(last_point)
	
	if direction.x > direction.y:
		result = "horizontal"
	elif direction.x < direction.y:
		result = "vertical"
	
	return result
func _detect_loop()-> String:
	var result : String = ""
	var loops : Array = []
	
	if !(loops.size() > 0):
		result = "loop"
	
	return result
func _detect_last_direction() -> String:
	var result : String = ""
	return result

func _detect_current_line_shape() -> void:
	if !current_line:
		return
	lines.append(_detect_curve_points())
#________________-SYMBOLS-________________#
func _recognise_symbol() -> void:
	var result : String = ""
	var character = null
	if lines in hiragana_dictionary:
		character = hiragana_dictionary[lines]

	if character != null:
		result = character
		print("character recognised ! ",character," ",lines)
	else:
		print("character not recognised ", lines)
	_update_label(result) 
	clear_frame()
func _update_label(text : String) -> void:
	if !label:
		return
	if text == "":
		$Warning.show()
		print("DRAWING FRAME - character not recognised : ",lines)
		await get_tree().create_timer(1).timeout
		$Warning.hide()
	else:
		label.text += text

func clear_frame() -> void:
	lines.clear()
	for child in get_children():
		if child.is_class("Line2D") or child.is_class("Sprite2D"):
			child.queue_free()
#________________-DEBUGGING-________________#
func _mark_point(point : Vector2, n :int) -> void:
	var new_marker := Sprite2D.new()
	new_marker.texture = PlaceholderTexture2D.new()
	new_marker.scale = Vector2(5,5)
	new_marker.z_index = 10
	add_child(new_marker)
	new_marker.position = point
	match n:
		1 :
			new_marker.modulate = Color(1.0, 0.0, 0.0, 1.0)
		2: 
			new_marker.modulate = Color(1.0, 1.0, 1.0, 1.0)
		3:
			new_marker.modulate = Color(0.0, 0.0, 1.0, 1.0)
