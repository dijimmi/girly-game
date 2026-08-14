extends HBoxContainer
@export var message : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func truncate_text(message_str : String):
	await get_tree().process_frame
	#print("Chat Bubble Message Size: %d" % message.size.x)
	
	if message_str.length() > Constants.message_limit:
		message.autowrap_mode = TextServer.AUTOWRAP_WORD
		$Bubble.size_flags_horizontal = SIZE_EXPAND_FILL
		message.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	else:
		message.autowrap_mode = TextServer.AUTOWRAP_OFF
		$Bubble.size_flags_horizontal = SIZE_FILL
		message.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	message.text = message_str
	scroll_down()

func setup(message_text: String) -> void:
	truncate_text(message_text)

func scroll_down():
	await get_tree().process_frame
	get_node("../..").scroll_vertical = get_node("../..").get_v_scroll_bar().max_value
