extends Control

var unlocked : bool = false
var button : Control

func _ready() -> void:
	button = self
	button.disabled = true
func update_dict_word(word : String, _unlocked : bool = false) -> void:
	button.text = word
	unlocked = _unlocked
	print(unlocked)
	if unlocked == true:
		await get_tree().create_timer(0.01).timeout
		button.disabled = false
		button.text = word
		$Label.text = Global.glossary.entries[word]["text"]
	elif unlocked == false:
		await button.resized
		button.custom_minimum_size.x = button.size.x
		button.text = "???"
		$Label.text = "???"
