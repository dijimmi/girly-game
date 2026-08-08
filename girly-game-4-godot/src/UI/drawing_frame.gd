class_name DrawingFrame extends Control

@export_category("Characters")
@export var hiragana_dictionary : Dictionary = {
	["horizontal", "vertical", "curved2"] : "あ",
	["horizontal", "vertical", "curved3"] : "あ",
	["curved2", "vertical", "vertical"] : "か",
	["curved1", "vertical", "vertical"] : "か",
}
@export var label : Label
@export_category("Drawing")
@export var max_point_distance : float = 5.5

func _ready() -> void:
	assert(label != null, "DrawingFrame's label isn't set correctly")
	$Delay.timeout.connect(recognise_symbol)

#________________-DRAWING-________________#
var mouse_pos : Vector2 = Vector2.ZERO
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && Input.is_action_pressed("draw"):
			mouse_pos = event.position
			draw_new_line()
			$Delay.start()
	elif event.is_action_released("draw"):
		detect_current_line_shape()
		current_line = null

var lines : Array = []
var current_line : Line2D = null
func draw_new_line() -> void:
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
func detect_curve_points() -> String:
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
				mark_point(first_point,1)
				mark_point(second_point,2)
				mark_point(third_point,3)
				ref_i = third_point_i
	if curve_points.size() == 0:
		result = h_or_v()
	else:
		result = "curved" + str(curve_points.size())
	return result

func h_or_v() -> String:
	var result : String = ""
	
	var first_point : Vector2 = current_line.points[0]
	var last_point  : Vector2 = current_line.points[current_line.get_point_count()-1]
	
	var direction : Vector2 = first_point.direction_to(last_point)
	
	if direction.x > direction.y:
		result = "horizontal"
	elif direction.x < direction.y:
		result = "vertical"
	
	return result
func detect_loop()-> String:
	var result : String = ""
	var loops : Array = []
	
	if !(loops.size() > 0):
		result = "loop"
	
	return result
func detect_last_direction() -> String:
	var result : String = ""
	return result

func detect_current_line_shape() -> void:
	if !current_line:
		return
	lines.append(detect_curve_points())
#________________-SYMBOLS-________________#
func recognise_symbol() -> void:
	var result : String = ""
	var character = null
	if lines in hiragana_dictionary:
		character = hiragana_dictionary[lines]
	if character != null:
		result = character
	lines.clear()
	update_label(result) 
func update_label(text : String) -> void:
	if text == "":
		$Warning.show()
		clear_frame()
		print("DRAWING FRAME - character not recognised : ",lines)
		await get_tree().create_timer(1).timeout
		$Warning.hide()
	else:
		label.text += text
		clear_frame()

func clear_frame() -> void:
	for child in get_children():
		if child.is_class("Line2D") or child.is_class("Sprite2D"):
			child.queue_free()
#________________-DEBUGGING-________________#
func mark_point(point : Vector2, n :int) -> void:
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
