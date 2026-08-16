extends Control

@export var name_widget_scene : PackedScene
@export var name_list : VBoxContainer

signal name_pressed_from_widget(cname : String)

var default_name = {
	"name": "default",
	"voiced_by" : []
	}


var names = [
	{"name": "Frank",
	"voiced_by" : ["lover","friend"]}
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in names.size():
		add_name_widget(i)
		
	add_name_widget_default()
	
	for widget in name_list.get_children():
		widget.name_pressed.connect(_on_name_pressed)


func _on_name_pressed(cname):
	name_pressed_from_widget.emit(cname)


func add_name_widget_default():
	var new_name = name_widget_scene.instantiate()
	new_name.setup(default_name, true)
	name_list.add_child(new_name)


func add_name_widget(index : int):
	var name_dict = names[index]
	var new_name = name_widget_scene.instantiate()
	new_name.setup(name_dict, false)
	name_list.add_child(new_name)


func verify_match(text : String):
	for name_widget in name_list.get_children():
		name_widget.verify_match(text)
