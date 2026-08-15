extends CanvasLayer

@export var glossary = Global.glossary
@export var word_button : PackedScene
@export var word_container : VBoxContainer

var buttons_dict : Dictionary[String,Button] = {}
func _ready() -> void:
	assert(glossary != null, "[Dictionary] the glossary isn't set properly")
	assert(word_button != null, "[Dictionary] word_button isn't set properly")
	assert(word_container != null, "[Dictionary] word_container isn't set properly")
	
	assert(word_label != null, "[Dictionary] word_label isn't set properly")
	assert(examples_Vbox != null, "[Dictionary] examples_Vbox isn't set properly")
	assert(definition != null, "[Dictionary] definition isn't set properly")
	
	EventBus.open_dictionary.connect(dictionary_anim_in)
	EventBus.unlock_word.connect(_unlock_word)
	
	$PageVBoxContainer/AllWords/HBoxContainer/WordDescription.hide()

	for word in glossary.entries :
		if !glossary.entries[word] in glossary.entries:
			var new_word_button : Button = word_button.instantiate()
			glossary.entries[word].set("unlocked", false)
			word_container.add_child(new_word_button)
			new_word_button.update_dict_word(word)
			new_word_button.pressed.connect(_word_clicked.bind(word))
			buttons_dict.set(word,new_word_button)
	_unlock_word("あお")

func _word_clicked(word : String) -> void:
	update_word_details(word)
func _unlock_word(word) -> void:
	buttons_dict[word].update_dict_word(word, glossary.entries[word]["unlocked"])

@export_category("word description")
@export var word_label : Label
@export var examples_Vbox : VBoxContainer
@export var definition : RichTextLabel

func update_word_details(word) -> void:
	if "text" in glossary.entries[word]:
		definition.text = glossary.entries[word]["text"]
	else:
		definition.text = ""
	if "extra" in glossary.entries[word] :
		var examples : Array = glossary.entries[word]["extra"].rsplit("\n")
		for i in examples.size():
			if i < examples_Vbox.get_child_count():
				examples_Vbox.get_child(i).text = "[ul]" + examples[i]
	word_label.text = glossary.entries[word]["name"]
	word_details_anim_in()
func word_details_anim_in() -> void:
	$PageVBoxContainer/AllWords/HBoxContainer/WordDescription.show()
func word_details_anim_out() -> void:
	$PageVBoxContainer/AllWords/HBoxContainer/WordDescription.hide()

func update_filter(toggled_on : bool):
	if toggled_on:
		for child in word_container.get_children():
			if child.unlocked == false:
				child.hide()
	else:
		for child in word_container.get_children():
			child.show()

func dictionary_anim_in() -> void:
	show()
func dictionary_anim_out() -> void:
	hide()
