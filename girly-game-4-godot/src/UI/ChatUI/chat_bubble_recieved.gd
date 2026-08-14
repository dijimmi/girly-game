extends HBoxContainer
@export var message : RichTextLabel

var delayed_reply = false
var i = 0
var dot_time = 0.0
var time_elapsed = 0.0
var target_message : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if delayed_reply:
		
		_animate_reply(delta)

func _animate_reply(delta : float) -> void:
	dot_time += delta
	time_elapsed += delta
	
	if time_elapsed >= Constants.REPLY_ANIMATION_TIME:
		delayed_reply = false
		dot_time = 0.0
		time_elapsed = 0.0
		truncate_text(target_message)
	else:
		if dot_time >= 0.5:
			message.text += "."
			dot_time = 0
			i += 1
			if i > 3:
				i = 0
				truncate_text("")


func truncate_text(message_str : String):
	await get_tree().process_frame
	#print("Chat Bubble Message Size: %d" % message.size.x)
	
	if message_str.length() > Constants.message_limit:
		message.autowrap_mode = TextServer.AUTOWRAP_WORD
		$BubbleReceived.size_flags_horizontal = SIZE_EXPAND_FILL
		message.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	else:
		message.autowrap_mode = TextServer.AUTOWRAP_OFF
		$BubbleReceived.size_flags_horizontal = SIZE_FILL
		message.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	message.text = message_str
	scroll_down()

# Has to be called after adding the child.
func setup(message_text: String, delayed : bool) -> void:
	if delayed:
		delayed_reply = true
		target_message = message_text
		truncate_text("")
	else:
		truncate_text(message_text)


func scroll_down():
	await get_tree().process_frame
	get_node("../..").scroll_vertical = get_node("../..").get_v_scroll_bar().max_value
