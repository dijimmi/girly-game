extends CanvasLayer
#main menu

func _ready() -> void:
	$MenuAnimationPlayer.play("menu_in")
	AudioManager.load_music("main menu")

func _on_new_save_button_pressed() -> void:
	EventBus.load_scene.emit("scene1")

func _on_playtest_button_pressed() -> void:
	EventBus.load_scene.emit("website1")

func _on_settings_button_pressed() -> void:
	$Settings.show()


func _on_play_mouse_entered() -> void:
	_play_hovered_anim()
func _on_play_mouse_exited() -> void:
	_play_hovered_anim_stop()

func _on_settings_button_mouse_entered() -> void:
	_settings_hovered_anim()
func _on_settings_button_mouse_exited() -> void:
	_settings_hovered_anim_stop()

func _on_quit_button_mouse_entered() -> void:
	_quit_hovered_anim()
func _on_quit_button_mouse_exited() -> void:
	_quit_hovered_anim_stop()

var _play_hover_tween : Tween
func _play_hovered_anim() -> void:
	if _play_hover_tween:
		_play_hover_tween.kill()
	_play_hover_tween = create_tween()
	_play_hover_tween.set_trans(Tween.TRANS_ELASTIC)
	_play_hover_tween.set_parallel(true)
	_play_hover_tween.tween_property($Control/Play, "position", Vector2(1100,277.0), 0.4)
	_play_hover_tween.tween_property($Control/Play, "self_modulate", Color("83d2e6"), 0.4)
	_play_hover_tween.tween_property($Control/Play/TextureRect, "self_modulate", Color("e6e6e6ff"), 0.4)
func _play_hovered_anim_stop() -> void:
	if _play_hover_tween:
		_play_hover_tween.kill()
	_play_hover_tween = create_tween()
	_play_hover_tween.set_trans(Tween.TRANS_ELASTIC)
	_play_hover_tween.set_parallel(true)
	_play_hover_tween.tween_property($Control/Play, "position", Vector2(1216,277.0), 0.4)
	_play_hover_tween.tween_property($Control/Play, "self_modulate", Color("bd6280"), 0.4)
	_play_hover_tween.tween_property($Control/Play/TextureRect, "self_modulate", Color("000000"), 0.4)

var _setting_hover_tween : Tween
func _settings_hovered_anim() -> void:
	if _setting_hover_tween:
		_setting_hover_tween.kill()
	_setting_hover_tween = create_tween()
	_setting_hover_tween.set_parallel(true)
	_setting_hover_tween.tween_property($Control/SettingsButton, "self_modulate", Color("9eafca"), 0.4)
	_setting_hover_tween.tween_property($Control/SettingsButton/TextureRect, "self_modulate", Color("ffffffff"), 0.4)
func _settings_hovered_anim_stop() -> void:
	if _setting_hover_tween:
		_setting_hover_tween.kill()
	_setting_hover_tween = create_tween()
	_setting_hover_tween.set_parallel(true)
	_setting_hover_tween.tween_property($Control/SettingsButton, "self_modulate", Color("e199af"), 0.4)
	_setting_hover_tween.tween_property($Control/SettingsButton/TextureRect, "self_modulate", Color("000000"), 0.4)

var _quit_hover_tween : Tween
func _quit_hovered_anim() -> void:
	if _quit_hover_tween:
		_quit_hover_tween.kill()
	_quit_hover_tween = create_tween()
	_quit_hover_tween.set_parallel(true)
	_quit_hover_tween.tween_property($Control/QuitButton, "self_modulate", Color("9eafca"), 0.2)
	_quit_hover_tween.tween_property($Control/QuitButton/TextureRect, "self_modulate", Color("ffffffff"), 0.2)
func _quit_hovered_anim_stop() -> void:
	if _quit_hover_tween:
		_quit_hover_tween.kill()
	_quit_hover_tween = create_tween()
	_quit_hover_tween.set_parallel(true)
	_quit_hover_tween.tween_property($Control/QuitButton, "self_modulate", Color("eebfc8"), 0.2)
	_quit_hover_tween.tween_property($Control/QuitButton/TextureRect, "self_modulate", Color("000000"), 0.2)
