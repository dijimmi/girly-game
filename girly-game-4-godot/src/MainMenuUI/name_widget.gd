extends PanelContainer

@export var name_label : RichTextLabel
@export var lover_icon : TextureButton
@export var friend_icon : TextureButton
@export var president_icon : TextureButton

@export var popup_layer : CanvasLayer

@export var is_default : bool

static var visible_names = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not is_default:
		visible_names += 1
		print("added: ",visible_names)
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


func _on_lover_icon_hover() -> void:
	print("Lover hovered!")
	popup_layer.visible = true
	
	var pos = lover_icon.global_position
	pos.x += lover_icon.size.x / 2 
	pos.x -= popup_layer.get_size().x / 2
	pos.y -= lover_icon.size.y
	popup_layer.move_to(pos)
	
	popup_layer.setup("Lover", !lover_icon.disabled)


func _on_friend_icon_hover() -> void:
	print("Friend hovered!")
	popup_layer.visible = true
	
	var pos = friend_icon.global_position
	pos.x += friend_icon.size.x / 2 
	pos.x -= popup_layer.get_size().x / 2
	pos.y -= friend_icon.size.y
	popup_layer.move_to(pos)
	
	popup_layer.setup("Friend", !friend_icon.disabled)


func _on_president_icon_mouse_entered() -> void:
	print("President hovered!")
	popup_layer.visible = true
	
	var pos = president_icon.global_position
	pos.x += president_icon.size.x / 2 
	pos.x -= popup_layer.get_size().x / 2
	pos.y -= president_icon.size.y
	popup_layer.move_to(pos)
	
	popup_layer.setup("President", !president_icon.disabled)


func _on_lover_icon_mouse_exited() -> void:
	popup_layer.visible = false


func _on_friend_icon_mouse_exited() -> void:
	popup_layer.visible = false


func _on_president_icon_mouse_exited() -> void:
	popup_layer.visible = false
