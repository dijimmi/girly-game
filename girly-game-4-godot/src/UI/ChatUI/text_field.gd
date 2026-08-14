class_name TextField
extends PanelContainer
@export var send_button : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP
	for child in get_children():
		child.mouse_filter = Control.MOUSE_FILTER_IGNORE

# Called every frame. 'delta' is the elapsed time since the previous frame.
var visible_char = 0
func _process(delta: float) -> void:
	if $Message.text == '' or $Message.text == Constants.SELECT_OPTION_MESSAGE:
		send_button.disabled = true
	else:
		send_button.disabled = false
	
	if visible_char < $Message.text.length():
		visible_char += 20 * delta
		$Message.visible_characters = visible_char

func current_message() -> String:
	return $Message.text

func new_message(message: String) -> void:
	if message != Constants.SELECT_OPTION_MESSAGE:
		$Message.visible_characters = 0
		visible_char = 0
	$Message.text = message
