extends Control

@export var name_widget_scene : PackedScene
@export var name_list : VBoxContainer

var default_name = {
	"name": "default",
	"voiced_by" : []
	}
	
var names = [
	{"name": "Itachi",
	"voiced_by" : ["lover","friend","president"]
	},
	{"name": "Evil Itachi",
	"voiced_by" : ["lover","friend","president"]
	},
	{"name": "Boruto",
	"voiced_by" : ["lover","friend","president"]
	},
	{"name": "Onii-chan",
	"voiced_by" : ["lover",]
	},
	{"name": "Nue",
	"voiced_by" : ["lover","president"]
	},
	{"name": "sample text",
	"voiced_by" : ["lover","president"]
	},
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in names.size():
		add_name_widget(i)
		
	add_name_widget_default()


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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
