extends PanelContainer

@export var name_label : RichTextLabel
@export var lover_icon : TextureButton
@export var friend_icon : TextureButton
@export var president_icon : TextureButton

@export var is_default : bool

static var visible_names = 0
signal name_pressed(cname : String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not is_default:
		visible_names += 1
	else:
		visible = false


func setup(name_dict : Dictionary, default : bool):
	name_label.text = name_dict['name']
	lover_icon.disabled = not 'lover' in name_dict["voiced_by"]
	friend_icon.disabled = not 'friend' in name_dict["voiced_by"]
	president_icon.disabled = not 'president' in name_dict["voiced_by"]
	
	is_default = default


func verify_match(text : String):
	var was_visible : bool = visible
	
	if is_default:
		print(visible_names)
		if visible_names < 1:
			name_label.text = text
			visible = true
		else:
			visible = false
		return
	
	var lowered_name_label = name_label.text.to_lower()
	visible = lowered_name_label.contains(text.to_lower())
	
	if was_visible != visible:
		if visible:
			visible_names += 1
		else:
			visible_names -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			name_pressed.emit(name_label.text)
