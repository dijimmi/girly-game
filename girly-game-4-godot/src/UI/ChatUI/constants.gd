extends Node

var buttons_disabled = false
var ended = false

const message_limit = 20

const NOTIFICATION_OFFSET = 10

const CHAT_SCREEN = "ChatScreen"
const MESSAGE_APP = "MessageApp"
const PHOTO_SCREEN = "PhotoScreen"
const GALLERY_APP = "GalleryApp"
const HOME = "Home"
const NOTES_APP = "NotesApp"
const NOTE_SCREEN = "NoteScreen"

const APPBAR_CHAT = "Chat (error, shouldn't display)"
const APPBAR_PHOTO = "Photo (error, shouldn't display)"
const APPBAR_MESSAGES = "Messages"
const APPBAR_GALLERY = "Gallery"
const APPBAR_NOTES = "Notes"
const APPBAR_HOME = "Home"

const PHOTOS : Dictionary = {
	"Photo1" : "res://icon.svg"
}
const CONVERSATIONS_PATH = "res://src/UI/ChatUI/Conversations/conversations.json"
const OPTIONS_PATH = "res://data/options.json"
const REPLIES_PATH = "res://data/replies.json"
const NOTES_PATH = "res://data/notes.json"

# Chats Names
const AI_CHAT = "AI"
const VERONICA_CHAT = "Vero~"

# Messages Types
const DATE_TYPE = "date"
const SENT_TYPE = "sent"
const RECEIVED_TYPE = "received"

# Load Input TYpes
const INPUT_OLD = "old"
const INPUT_OPTIONS_MENU = "options_menu"
const INPUT_OPTION_SELECTED = "option_selected"
const INPUT_SENT = "sent"


const INPUT_TRIGGERED = "triggered--"
const REPLY_TRIGGERED = "reply_now--"
const STOP_CONVO = "stop--"

const SELECT_OPTION_MESSAGE = "Select an Option..."
const END_OF_MESSAGES = "END OF MESSAGES"
const NOTE_TITLE_TRIGGER_1 = "journal entry 2023 #12"
const NOTE_TITLE_TRIGGER_2 = "[PRIVATE] journal entry 2026 #35"

const HINT = "Hints"

const IMMEDIATE = "__immediate__"
const WAIT_5_SECONDS = "__wait5__"


var HINT_NOTE : Dictionary = {
		"title": Constants.HINT,
		"date": "05/11/2026",
		"content": ""
	}

const NOTES_PIN = "3141"
const TRY_AGAIN = "Try Again."
const ENTER_PASSWORD = "Password..."

const REPLY_ANIMATION_TIME = 0.1
const REPLY_INITIAL_DELAY = 0.5

const NOTIFICATION_DURATION = 3.0
const PHONE_OPEN_TIME = 3.0
