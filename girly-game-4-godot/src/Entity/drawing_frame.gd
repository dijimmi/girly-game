class_name DrawingFrame extends Control

@export_category("Characters")
@export var hiragana_dictionary : Dictionary = {
	["horizontal", "vertical", "curved4leftloop1"] : "あ",
	["curve1", "vertical", "curved3leftloop1"]     : "あ",
	["curve1", "vertical", "curved4leftloop2"]     : "あ",
	["curved2left", "vertical", "vertical"] : "か",
	["curved1left", "vertical", "vertical"] : "か",
	["curved2up", "vertical", "vertical"]   : "か",
	["horizontal", "curved1left", "horizontal"] : "さ",
	["horizontal", "curved1up", "curved1right"] : "さ",
	["horizontal", "vertical", "curved1up"]     : "さ",
	["horizontal", "vertical", "horizontal", "horizontal"]   : "た",
	["horizontal", "vertical", "curved1right", "curved1right"] : "た",
	["horizontal", "vertical", "horizontal", "curved3rightloop1"] : "な", 
	["horizontal", "vertical", "curved1left", "curved2rightloop1"] : "な",
	["horizontal", "vertical", "curved1left", "curved2downloop1"] : "な",
	["horizontal", "vertical", "curved1left", "curved2downloop2"] : "な",
	["horizontal", "vertical", "curved1left", "curved2rightloop2"] : "な",
	["curved1up", "horizontal", "curved2downloop1"] : "は",
	["curved1right", "horizontal", "curved2rightloop1"] : "は",
	["curved1up", "horizontal", "curved3downloop1"] : "は",
	["vertical", "horizontal", "curved3rightloop1"] : "は",
	["horizontal", "horizontal", "curved2downloop1"] : "ま",
	["horizontal", "horizontal", "curved2rightloop1"] : "ま",
	["horizontal", "horizontal", "curved3rightloop1"] : "ま",
	["curved2left", "horizontal", "vertical"]   : "や",
	["curved1left", "vertical", "vertical"] : "や",
	["curved2up", "horizontal", "vertical"]   : "や",
	["curved1up", "vertical", "vertical"] : "や",
	["curved1left", "curved2left"] : "ら",
	["curved1down", "curved3left"] : "ら",
	["curved1down", "curved3up"] : "ら",
	["vertical", "curved4down"] : "わ", 
	["vertical", "curved4left"] : "わ",
	["vertical", "curved3leftloop3"] : "わ", 
	["vertical", "curved4leftloop1"] : "わ",
	["vertical", "curved4leftloop5"] : "わ",
	["vertical", "curved4uploop1"] : "わ",
	["vertical", "curved3leftloop"] : "わ",
	
	["curved1up", "verticala"]   : "い",
	["curved1right", "verticala"] : "い",
	["vertical", "vertical"]      : "い",
	["horizontal", "horizontal", "curved1left", "curved1right"] : "き",
	["horizontal", "horizontal", "vertical", "horizontal"]      : "き",
	["curved1up"] : "し",
	["curved2up"] : "し",
	["horizontal", "curved3left"]: "ち",
	["horizontal", "curved2left"]: "ち",
	["curved1up", "horizontal","horizontal"]: "に",
	["curved1right", "horizontal","curved1right"]: "に",
	["curved5right"]      : "ひ",
	["curved5down"]       : "ひ",
	["curved4down"]       : "ひ",
	["curved3right"]      : "ひ",
	["curved4right"]      : "ひ",
	["curved4downloop2"]  : "ひ",
	["curved4rightloop5"] : "ひ",
	["curved4rightloop1"] : "ひ",
	["curved5rightloop2"] : "ひ",
	["curved3rightloop1","vertical"]: "み",
	["curved3downloop1","curved1down"]: "み",
	["curved3downloop1","curved1left"]: "み",
	["vertical","curved1left"]: "り",
	["curved1up","vertical"]: "り",
	["curved1right","vertical"]: "り",
	

	
	["horizontal", "curved1left"] : "う",
	["horizontal", "curved1up"] : "う",
	["horizontal", "curved2left"] : "う",
	["curved1rightku"] : "く",
	["curved1downku"]  : "く",
	["horizontal","curved2leftloop1"] : "す",
	["horizontal","curved3leftloop1"] : "す",
	["horizontal","curved3leftloop4"] : "す",
	["horizontal","curved4leftloop1"] : "す",
	["horizontal","curved4leftloop2"] : "す",
	["curved1left"] : "つ",
	["curved2left"] : "つ",
	["vertical", "curved5downloop1"]    : "ぬ",
	["vertical", "curved5downloop2"]    : "ぬ",
	["vertical", "curved5rightloop1"]   : "ぬ",
	["vertical", "curved5rightloop2"]   : "ぬ",
	["vertical", "curved5rightloop3"]   : "ぬ",
	["curved1down", "curved6downloop2"] : "ぬ",
	["horizontal", "curved6downloop5"]  : "ぬ",
	["curved1down", "curved7downloop2"] : "ぬ",
	["curved1down", "curved1left", "curved1right", "vertical"] : "ふ",
	["curved1left", "cureved1up", "curved1up", "horizontal"]   : "ふ",
	["horizontal", "curved4uploop1", "horizontal"] : "む",
	["horizontal", "curved5uploop1", "horizontal"] : "む",
	["horizontal", "curved5uploop2", "horizontal"] : "む",
	["horizontal", "curved6downloop2", "horizontal"] : "む",
	["horizontal", "curved4tleftloop1", "vertical"] : "む",
	["curved3left", "vertical"]     : "ゆ",
	["curved4left", "vertical"]     : "ゆ",
	["curved4leftloop1","vertical"] :"ゆ",
	["curved3up", "vertical"]       : "ゆ",
	["curved4up", "vertical"]       : "ゆ",
	["curved4uploop1","vertical"]   :"ゆ",
	["curved4downloop1"] : "る",
	["curved5downloop1"] : "る",
	["curved6downloop1"] : "る",
	["curved4downloop2"] : "る",
	["curved5downloop2"] : "る",
	["curved6downloop2"] : "る",
	["curved6downloop3"] : "る",
	
	["horizontal", "curved3rightloop1"] : "え",
	["horizontal", "curved3rightloop2"] : "え",
	["horizontal", "curved4rightloop1"]  : "え",
	["horizontal", "curved4rightloop2"]  : "え",
	["horizontal", "curved4rightloop2"]  : "え",
	["horizontal", "curved4uploop1"]  : "え",
	["horizontal", "curved4down"]  : "え",
	["horizontal", "curved4right"]  : "え",
	["curved1up", "horizontal","curved1down"] : "け",
	["curved1right", "horizontal","curved1left"] : "け",
	["vertical", "horizontal","vertical"] : "け",
	["horizontal", "curved1left", "curved1right"]  : "せ",
	["curved2right"] : "て",
	["curved3right"] : "て",
	["curved2rightloop1"] : "て",
	["vertical", "curved5downloop1"] : "ね",
	["vertical", "curved5downloop2"] : "ね",
	["vertical", "curved5downloop4"] : "ね",
	["vertical", "curved6downloop1"] : "ね",
	["vertical", "curved6downloop2"] : "ね",
	["vertical", "curved6downloop3"] : "ね",
	["vertical", "curved6downloop4"] : "ね",
	["vertical", "curved6downloop5"] : "ね",
	["vertical", "curved6downloop6"] : "ね",
	["curved1downhe"] : "へ",
	["curved1righthe"] : "へ",
	["vertical", "curve3leftloop1"] : "め",
	["vertical", "curved4leftloop1"] : "め",
	["horizontal", "curved5leftloop1"] : "め",
	["vertical", "curved4up"] : "れ",
	["vertical", "curved4uploop1"] : "れ",
	
	["horizontal", "curved4leftloop1", "horizontal"] : "お",
	["horizontal", "curved3leftloop1", "vertical"] : "お",
	["horizontal", "curved3leftloop1", "curved1down"] : "お",
	["curved1left", "horizontal"] : "こ",
	["curved1left", "curved1right"]    : "こ",
	["curved4right"]      : "そ",
	["curved4rightloop4"] : "そ",
	["curved5rightloop2"] : "そ",
	["curved5rightloop1"] : "そ",
	["curved5right"]      : "そ",
	["vertical", "curved1right"]   : "と",
	["horizontal", "curved2right"] : "と",
	["curved4left"]      : "の",
	["curved4leftloop1"] : "の",
	["curved4leftloop2"] : "の",
	["curved3leftloop1"] : "の",
	["curved1up", "horizontal", "horizontal", "curved2downloop1"] : "ほ",
	["curved1right", "horizontal", "horizontal", "curved2downloop2"] : "ほ",
	["curved1up", "horizontal", "horizontal", "curved2rightloop1"] : "ほ",
	["curved1right", "horizontal", "horizontal", "curved2rightloop2"] : "ほ",
	["curved2up", "horizontal", "horizontal"] : "も",
	["curved2left", "horizontal", "horizontal"] : "も",
	["horizontal","curved2rightloop1"] : "よ",
	["horizontal","curved3rightloop1"] : "よ",
	["horizontal","curved3downloop1"] : "よ",
	["curved4left"] : "ろ",
	["curved4leftloop1"] : "ろ",
	["horizontal", "curved2down", "curved1right"]      : "を",
	["horizontal", "curved2downloop1", "curved2right"] : "を",
	["curved4down"] : "ん",
	["curved2downloop2"] : "ん",
	["curved3up"] : "ん",
	["curved3left"] : "ん",
	["curved3down"] : "ん",
}
@export var dakuten_hiragana_dictionary : Dictionary = {
	"が" : "か",
	"ぎ" : "き",
	"ぐ" : "く",
	"げ" : "け",
	"ご" : "こ",
	
	"ば" : "は",
	"び" : "ひ",
	"ぶ" : "ふ",
	"べ" : "へ",
	"ぼ" : "ほ",
	
	"だ" : "た",
	"ぢ" : "ち", #dji/ji
	"づ" : "つ", #dzu/zu
	"で" : "て",
	"ど" : "と",
	
	"ざ" : "さ",
	"じ" : "し", #ji
	"ず" : "す",
	"ぜ" : "せ",
	"ぞ" : "そ",
}
@export var handakuten_hiragana_dictionary : Dictionary = {
	"ぱ" : "は",
	"ぴ" : "ひ",
	"ぷ" : "ふ",
	"ぺ" : "へ",
	"ぽ" : "ほ",
}
@export var mini_hiragana_dictionary : Dictionary = {
	"っ" : "つ",
	"ゅ": "ゆ",
	"ぇ": "え",
	"ゃ": "や",
	"ょ": "よ",
}
@export var hiragana_picture : Dictionary[String, HiraganaFrames] = {
	"あ": null,
	"か": null,
	"さ": null,
	"た": null,
	"な": null,
	"は": null,
	"ま": null, 
	"や": null,
	"ら": null,
	"わ": null, 
	
	"い": null,
	"き": null,
	"し": null,
	"ち": null,
	"に": null,
	"ひ": null,
	"み": null,
	"り": null,
	
	"う" : null,
	"く" : null,
	"す" : null,
	"つ" : null,
	"ぬ" : null,
	"ふ" : null,
	"む" : null,
	"ゆ" : null,
	"る" : null,

	"え" : null,
	"け" : null,
	"せ" : null,
	"て" : null,
	"ね" : null,
	"へ" : null,
	"め" : null,
	"れ" : null,
	
	"お" : null,
	"こ" : null,
	"そ" : null,
	"と" : null,
	"の" : null,
	"ほ" : null,
	"も" : null,
	"よ" : null,
	"ろ" : null,
	"を" : null,
	
	"ん" : null
}
@export var ten_pictures : Dictionary[String, Texture2D] = {
	"handakuten" : null,
	"dakuten" : null,
}
@export var label : Label
@export_category("Drawing")
@export var max_point_distance : float = 5.5

@export_category("Music")
@export var good_line : Array[AudioStream] = [
	load("uid://bhb2i27yj6ao6")] #u_o8xh7gwsrj-correct
@export var wrong_line : AudioStream = load("uid://bf46uodjtpcoq")
@export var marker_draw : Array[AudioStream] = [
	load("uid://c2ws4rnd3v35j"),
	load("uid://da8dnm4j5ne71"),
	load("uid://cwhlpsjq2s513"),
]
func _ready() -> void:
	if get_parent():
		$Delay.timeout.connect(get_parent().verify_symbol)

#________________-SYMBOLS-________________#
func recognise_line(i : int = get_parent().current_line) -> bool:
	
	var result = false
	var total_lines = []

	var value_to_look_for = get_parent().current_character
	if current_line == null:
		return result
	if current_line.points.size() < 10:
		return result
	for line in hiragana_dictionary:
		
		if hiragana_dictionary[line] == value_to_look_for:
			total_lines.append(line[i])

	if total_lines.has(lines[i]):
		result = true
	else:
		AudioManager.play_sfx($Effects, wrong_line)
		print("[drawing_frame] : character not recognised. Possible line : ", total_lines," recognised line : ", lines[i])
	return result
func recognise_character():
	var value_to_look_for = get_parent().current_character
	var nbr_of_lines = hiragana_dictionary.find_key(value_to_look_for).size()
	if nbr_of_lines > lines.size():
		return null
	
	for i in nbr_of_lines:
		if recognise_line(i) == false:
			return false
	print("[drawing_frame] : character recognised. Recognised lines : ", lines)
	return true

func update_label(text : String) -> void:
	if !label:
		return
	if text == "":
		$Warning.show()
		print("DRAWING FRAME - character not recognised : ",lines)
		await get_tree().create_timer(1).timeout
		$Warning.hide()
	else:
		label.text += text
func clear_label() -> void:
	label.text = ""
func clear_frame() -> void:
	lines.clear()
	for child in get_children():
		if child.is_class("Line2D") or child.is_class("Sprite2D"):
			child.queue_free()

#________________-DRAWING-________________#
var mouse_pos : Vector2 = Vector2.ZERO
func _gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("draw"):
		print("helllo???")
		AudioManager.play_random_sfx($Stroke, marker_draw)
	elif event is InputEventMouseMotion && Input.is_action_pressed("draw"):
			mouse_pos = event.position
			_draw_new_line()
			$Delay.start()
	elif event.is_action_released("draw"):
		_detect_current_line_shape()
		if get_parent().difficulty == 0:
			get_parent().verify_line()
		current_line = null

var lines : Array = []
var current_line : Line2D = null
var last_comitted_point : Vector2
func _draw_new_line() -> void:
	if current_line == null:
		current_line = Line2D.new()
		current_line.default_color = Color(0,0,0)
		current_line.add_to_group("Lines")
		add_child(current_line)
		current_line.add_point(mouse_pos)
		last_comitted_point = mouse_pos
	
	if mouse_pos.distance_to(last_comitted_point) >= max_point_distance:
		current_line.add_point(mouse_pos)
		last_comitted_point = mouse_pos
	else:
		var last_pi  = current_line.get_point_count() -1
		current_line.set_point_position(last_pi ,mouse_pos)

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
				#_mark_point(first_point,1)
				#_mark_point(second_point,2)
				#_mark_point(third_point,3)
				ref_i = third_point_i
	if curve_points.size() == 0:
		result = _h_or_v()
	else:
		result = (
			"curved" + str(curve_points.size()) + 
			_detect_last_direction() + 
			_detect_loop() +
			_is_it_he_or_ku()
		)
	
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
	var step : int = 1
	if current_line.points.size() < step*2 + 4:
		return result
	
	for i in range(current_line.points.size()-step):
		var a1 : Vector2 = current_line.points[i]
		var a2 : Vector2 = current_line.points[i + step]
		for j in range(i+2, current_line.points.size()-step):
			var b1 : Vector2 = current_line.points[j]
			var b2 : Vector2 = current_line.points[j+step]
			var hit = Geometry2D.segment_intersects_segment(a1,a2,b1,b2)
			
			if hit != null && j > i+4:
				loops.append(b1)
				result = "loop"
	if loops.size() > 0:
		result += str(loops.size())
	
	return result
func _detect_last_direction() -> String:
	var result : String = ""
	var p_direction = current_line.points[-2].direction_to(current_line.points[-1])
	if abs(p_direction.x) > abs(p_direction.y):
		if p_direction.x > 0:
			result = "right"
		else:
			result = "left"
	else:
		if p_direction.y > 0:
			result = "down"
		else:
			result = "up"

	
	return result
func _is_it_he_or_ku() -> String:
	var result = ""
	var symbol_to_teach = get_parent().current_character
	if lines.size() == 0 && (symbol_to_teach == "へ" or symbol_to_teach == "く"):
		var fpoint = current_line.points[0]
		var lpoint = current_line.points[-1]
		if fpoint.x > size.x/2 and lpoint.x > size.x/2:
			result = "ku"
		if fpoint.y > size.y/2 and lpoint.y > size.y/2:
			result = "he"
	return result
func _detect_current_line_shape() -> void:
	if !current_line:
		return
	lines.append(_detect_curve_points())

#________________-DEBUGGING-________________#
func _mark_point(point : Vector2, n :int) -> void:
	var new_marker := Sprite2D.new()
	new_marker.texture = PlaceholderTexture2D.new()
	new_marker.scale = Vector2(5,5)
	new_marker.z_index = 10
	current_line.add_child(new_marker)
	new_marker.position = point
	match n:
		1 :
			new_marker.modulate = Color(1.0, 0.0, 0.0, 1.0)
		2: 
			new_marker.modulate = Color(1.0, 1.0, 1.0, 1.0)
		3:
			new_marker.modulate = Color(0.0, 0.0, 1.0, 1.0)
