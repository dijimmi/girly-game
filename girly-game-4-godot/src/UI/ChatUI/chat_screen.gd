class_name ChatScreen
extends PanelContainer

signal trigger_notification(appname : String, attrib_name : String, preview : String)

@export var chat_bubble_sent : PackedScene
@export var chat_bubble_recieved : PackedScene
@export var date_scene : PackedScene

@export var messages_list : Container

@export var input_field: TextField

@export var options_menu : PanelContainer

enum TRIGGER { PROMPTED, COMPLETED, INACTIVE }

## Game variable that determines if the player can text or not.
var conversations : Dictionary = {}
var replies_dict : Dictionary = {}

var new_convo : Dictionary = {
	Constants.VERONICA_CHAT : [
		Constants.INPUT_TRIGGERED,
		"Yo, Aoi",
		Constants.REPLY_TRIGGERED,
		"What's up?",
		"Already in trouble? :P",
		Constants.INPUT_TRIGGERED,
		"Not yet, just wanted to say hi.",
		Constants.REPLY_TRIGGERED,
		"Oh, hi~",
		"If you need help with the outfit.",
		"I can help",
		"But Ayumi might not be as impressed",
		"Consider that before asking for help.",
		Constants.INPUT_TRIGGERED,
		"I... think I need your help",
		Constants.REPLY_TRIGGERED,
		"Alright.",
		"She asked for a head piece, right?",
		"With pastel colors?",
		"Hmm, don't focus too much on the brand",
		"Get the colors she asked for.",
		"White and soft blue should do.",
		Constants.INPUT_TRIGGERED,
		"I... think I need your help",
		"Again...",
		Constants.REPLY_TRIGGERED,
		"Get her the hat piece",
		Constants.STOP_CONVO
	]
}

var is_replying : Dictionary = {
	Constants.VERONICA_CHAT : false
}

var index : Dictionary = {
	Constants.VERONICA_CHAT : 0
}

var indices : Dictionary
var reply_indices : Dictionary
var last_option_chosen : Dictionary
var last_person : String

var first_time : Dictionary = {
	Constants.AI_CHAT : true,
	Constants.VERONICA_CHAT : true
}

var talked_to_ai_after_lock = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load_conversation(Constants.VERONICA_CHAT)
	#continue_conversation(Constants.VERONICA_CHAT)
	pass

""" 
Buttons Pressed 
"""

func start_conversation(person):
	load_conversation(person)
	continue_conversation(person)


func _on_text_field_gui_input(event: InputEvent) -> void:
	if input_field.current_message() == Constants.SELECT_OPTION_MESSAGE:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			#toggle_options_menu()
			#load_input(Constants.INPUT_OPTIONS_MENU, last_person)
			pass


func on_option_selected():
	print("OPTION SELECTED IN CHAT SCREEN")
	#load_input(Constants.INPUT_OPTION_SELECTED, last_person)
	#toggle_options_menu()


func _on_send_button_pressed():
	var message_text = input_field.get_child(0).text
	input_field.new_message("")
	
	if message_text != '':
		add_sent_message(last_person, message_text, true)
		continue_conversation(last_person)

""" 
Helper Functions 
"""

func load_json(file_path : String) -> Dictionary:
	var file = FileAccess.open(file_path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()
	return data


func is_list(options_list) -> bool:
	if options_list is Array:
		return true
	return false


func toggle_options_menu():
	$OptionsHover.visible = !$OptionsHover.visible

""" 
Displaying Messages 
"""

func add_date(person_name, date_text, is_new : bool):
	var date = date_scene.instantiate()
	messages_list.add_child(date)
	date.setup(date_text)

	await get_tree().process_frame
	$ScreenWidgets/ScrollContainer.scroll_vertical = $ScreenWidgets/ScrollContainer.get_v_scroll_bar().max_value

	
	if is_new:
		update_conversation(person_name, Constants.DATE_TYPE, date_text)


func add_sent_message(person_name, message_text, is_new : bool):
	if person_name in first_time.keys() and first_time[person_name] and is_new:
		add_date(person_name, "Today", true)
		first_time[person_name] = false
	
	var bubble = chat_bubble_sent.instantiate()
	messages_list.add_child(bubble)
	bubble.setup(message_text)
	
	if is_new:
		update_conversation(person_name, Constants.SENT_TYPE, message_text)


func add_recieved_message(person_name, message_text, is_new : bool):
	if person_name in first_time.keys() and first_time[person_name] and is_new:
		add_date(person_name, "Today", true)
		first_time[person_name] = false
	
	var bubble = chat_bubble_recieved.instantiate()
	
	if is_new:
		await get_tree().create_timer(Constants.REPLY_INITIAL_DELAY).timeout
		
	messages_list.add_child(bubble)
	bubble.setup(message_text, is_new)
	
	if is_new:
		update_conversation(person_name, Constants.RECEIVED_TYPE, message_text)


func continue_conversation(person):
	if index[person] >= new_convo[person].size():
		print("NONONONONO it's the end")
		return
	
	var curr_message = new_convo[person][index[person]]
	var is_reply = is_replying[person]
	last_person = person
	
	if curr_message == Constants.STOP_CONVO:
		print("Conversation Stopped")
		return
	
	if curr_message == Constants.REPLY_TRIGGERED:
		input_field.new_message("")
		
		index[person] += 1
		curr_message = new_convo[person][index[person]]
		
		add_recieved_message(person, curr_message, true)
		
		is_reply = true
		is_replying[person] = is_reply
		index[person] += 1
		
		await get_tree().create_timer(Constants.REPLY_ANIMATION_TIME + Constants.REPLY_INITIAL_DELAY).timeout
		
	elif curr_message == Constants.INPUT_TRIGGERED:
		index[person] += 1
		curr_message = new_convo[person][index[person]]
		
		input_field.new_message(curr_message)
		
		is_reply = false
		is_replying[person] = is_reply
		index[person] += 1
		
		return
	
	else:
		if is_reply:
			add_recieved_message(person, curr_message, true)
			await get_tree().create_timer(Constants.REPLY_ANIMATION_TIME + Constants.REPLY_INITIAL_DELAY).timeout
		else:
			input_field.new_message(curr_message)
			index[person] += 1
			return
			
		index[person] += 1
	
	continue_conversation(person)

""" 
Loading Conversations 
"""

# Loads the conversation saved for the specific person. In first call,
# it will load the conversation from the json file, but then
# it will load it from the local dictionary
func load_conversation(person_name : String) -> void:
	for child in messages_list.get_children():
		child.queue_free()
	
	last_person = person_name
	
	if conversations.is_empty():
		print("Loading %s's conversation..." % [person_name])
		conversations = load_json(Constants.CONVERSATIONS_PATH)
	
	if person_name not in conversations:
		print("Invalid Name. Conversation Not Loaded.")
		return
		
	var convo = conversations[person_name]
	for message_dict in convo["messages"]:
		var type = message_dict['type']
		var text = message_dict['text']
		
		if type == Constants.DATE_TYPE:
			add_date(person_name, text, false)
		elif type == Constants.SENT_TYPE:
			add_sent_message(person_name, text, false)
		elif type == Constants.RECEIVED_TYPE:
			add_recieved_message(person_name, text, false)
			
	#load_input(Constants.INPUT_OLD, person_name)

# Adds the last message added into the conversation (sent, recieved or even a date)
# into the conversations dictionary that is saved for when you come back
# to the conversation
func update_conversation(person_name : String, type : String, message : String) -> void:
	if conversations.is_empty():
		return
	
	if person_name not in conversations:
		print("Invalid Name. Conversation Not Updated.")
		return
		
	var message_dict = {
		"type" : type,
		"text" : message
	}
	conversations[person_name]["messages"].append(message_dict)
	
	print("Appended new message")

""" 
Game Logic 
"""


# This is primarly for the game I made before. This shouldn't be used either
func _on_visibility_changed() -> void:
	await get_tree().process_frame
	if last_person != Constants.AI_CHAT and visible:
		if Constants.INPUT_TRIGGERS[Constants.KNOW_MISSING][TRIGGER.PROMPTED]:
			if !Constants.INPUT_TRIGGERS[Constants.KNOW_MISSING][TRIGGER.COMPLETED]:
				print("Opened Another Chat")
				print("Waiting %d seconds" % Constants.NOTIFICATION_DURATION)
				
				await get_tree().create_timer(Constants.NOTIFICATION_DURATION).timeout
				Constants.INPUT_TRIGGERS[Constants.KNOW_MISSING][TRIGGER.COMPLETED] = true
				configure_notification(Constants.HINT, Constants.KNOW_MISSING)


func configure_notification(from_who, trigger_msg):
	#var message
	
	#if check_input_trigger(trigger_msg):
		#if Constants.INPUT_TRIGGERS[trigger_msg][TRIGGER.COMPLETED]:
			#message = Constants.INPUT_TRIGGER_HINTS[trigger_msg][TRIGGER.COMPLETED]
		#else:
			#message = Constants.INPUT_TRIGGER_HINTS[trigger_msg][TRIGGER.PROMPTED]
		#trigger_notification.emit(Constants.APPBAR_NOTES, Constants.HINT, message)
		#add_to_hint(message)
		#return
	#
	trigger_notification.emit(Constants.APPBAR_MESSAGES, from_who, trigger_msg)


func add_to_hint(message):
	Constants.HINT_NOTE['content'] += "• %s\n" % message
	return
