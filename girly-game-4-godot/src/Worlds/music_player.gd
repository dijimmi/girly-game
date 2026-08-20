extends PanelContainer

@export var song_thumbnail: TextureRect
@export var song_name: RichTextLabel
@export var aritst_name: RichTextLabel

@export var song_time: HSlider
@export var current_song: AudioStreamPlayer
@export var song_list: VBoxContainer
@export var volume_slider: VSlider

@export var volume_btn: Button
@export var unmute_icon: Texture2D
@export var mute_icon: Texture2D

@export var next_song_1_bg: Control
@export var next_song_1_label: Label

@export var next_song_2_bg: Control
@export var next_song_2_label: Label


var bus_index: int = -1
var is_muted: bool = false
var previous_volume: float = 1.0

var songs = [
	{
		"title": "結んだ末は (feat. カゼヒキ)",
		"artist": "あいすここあ",
		"image": preload("uid://bcy25rjjjf2oj"), #mu2.png
		"file": preload("uid://bex6hlykmru1o"), #結んだ末は_mas
	},
	{
		"title": "Website",
		"artist": "OWMG",
		"image": preload("uid://6jtbpbyxv7tt"), #icon.svg
		"file": preload("uid://dy71tjj1kvkh3"), #Dijimmi_LearningJapanese_G maj_96.mp3
	},
]

var song_index: int = 0
var next_song_1_index: int = 0
var next_song_2_index: int = 0
var current_value: float = 0.0
var is_dragging: bool = false


func _ready() -> void:
	await get_tree().process_frame
	
	_route_existing_music_players()
	_init_volume_slider()
	
	# Start the first song
	setup_song(0, true)
	
	next_song_1_bg.gui_input.connect(_on_next_song_1_input)
	next_song_2_bg.gui_input.connect(_on_next_song_2_input)
	current_song.finished.connect(_on_current_song_finished)


func setup_song(index: int, play: bool = true) -> void:
	# Wrap around playlist
	if index < 0:
		index = songs.size() - 1
	
	if index >= songs.size():
		index = 0
	
	song_index = index
	current_value = 0.0
	
	song_thumbnail.texture = songs[index]["image"]
	song_name.text = songs[index]["title"]
	aritst_name.text = songs[index]["artist"]
	_update_up_next()
	
	current_song.stop()
	current_song.stream_paused = false
	current_song.stream = songs[index]["file"]
	current_song.bus = "Music"
	
	song_time.max_value = current_song.stream.get_length()
	song_time.value = 0.0
	
	if play:
		current_song.play()


func _update_up_next() -> void:
	next_song_1_index = (song_index + 1) % songs.size()
	next_song_2_index = (song_index + 2) % songs.size()
	next_song_1_label.text = songs[next_song_1_index]["title"]
	next_song_2_label.text = songs[next_song_2_index]["title"]


func _process(_delta: float) -> void:
	if current_song.is_playing() and not current_song.stream_paused:
		current_value = current_song.get_playback_position()
		
		if not is_dragging:
			song_time.value = current_value


func _on_song_time_value_changed(_value: float) -> void:
	pass


func _on_play_pause_pressed() -> void:
	if current_song.stream_paused:
		# Currently paused -> resume
		current_song.stream_paused = false
	
	elif current_song.playing:
		# Currently playing -> pause
		current_value = current_song.get_playback_position()
		current_song.stream_paused = true
	
	else:
		# Not playing at all -> start/resume from saved position
		current_song.play(current_value)


func _on_song_time_drag_started() -> void:
	is_dragging = true
	
	if current_song.playing:
		current_song.stream_paused = true


func _on_song_time_drag_ended(value_changed: bool) -> void:
	is_dragging = false
	
	if value_changed:
		current_song.seek(song_time.value)
		current_value = song_time.value
	
	current_song.stream_paused = false


func _on_back_pressed() -> void:
	# If we're more than 2 seconds into the song,
	# restart the current song instead.
	if current_song.get_playback_position() > 2.0:
		current_value = 0.0
		current_song.seek(0.0)
		return
	
	# Otherwise go to previous song
	song_index -= 1
	
	if song_index < 0:
		song_index = songs.size() - 1
	
	setup_song(song_index)


func _on_forward_pressed() -> void:
	song_index += 1
	
	if song_index >= songs.size():
		song_index = 0
	
	setup_song(song_index)


func _on_current_song_finished() -> void:
	_on_forward_pressed()


func _route_existing_music_players() -> void:
	var website := get_tree().current_scene
	
	if website == null:
		return
	
	# Stop the old music players in Website1.
	# CurrentSong now handles the music instead.
	for player_name in ["Song", "Song2", "Song3", "Song4"]:
		var player := website.get_node_or_null(player_name)
		
		if player is AudioStreamPlayer:
			player.stop()
			player.autoplay = false
	
	current_song.bus = "Music"


func _init_volume_slider() -> void:
	bus_index = AudioServer.get_bus_index("Music")
	
	if bus_index == -1:
		push_error("Music audio bus does not exist!")
		return
	
	current_song.bus = "Music"
	
	volume_slider.min_value = 0.0
	volume_slider.max_value = 1.0
	volume_slider.step = 0.01
	volume_slider.rounded = false
	
	if not volume_slider.value_changed.is_connected(
		_on_volume_slider_value_changed
	):
		volume_slider.value_changed.connect(
			_on_volume_slider_value_changed
		)
	
	is_muted = AudioServer.is_bus_mute(bus_index)
	
	var current_db := AudioServer.get_bus_volume_db(bus_index)
	var current_linear := db_to_linear(current_db)
	
	volume_slider.set_value_no_signal(current_linear)
	
	if current_linear > 0.0:
		previous_volume = current_linear
	
	update_volume_icon()


func _on_volume_slider_value_changed(value: float) -> void:
	if bus_index == -1:
		return
	
	value = clamp(value, 0.0, 1.0)
	
	if value <= 0.0:
		AudioServer.set_bus_mute(bus_index, true)
		is_muted = true
	
	else:
		AudioServer.set_bus_volume_db(
			bus_index,
			linear_to_db(value)
		)
		
		AudioServer.set_bus_mute(bus_index, false)
		
		is_muted = false
		previous_volume = value
	
	update_volume_icon()


func _on_volume_btn_pressed() -> void:
	if bus_index == -1:
		return
	
	is_muted = !AudioServer.is_bus_mute(bus_index)
	
	AudioServer.set_bus_mute(
		bus_index,
		is_muted
	)
	
	update_volume_icon()


func update_volume_icon() -> void:
	if is_muted or volume_slider.value <= 0.0:
		volume_btn.icon = mute_icon
	else:
		volume_btn.icon = unmute_icon


func _on_next_song_1_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		setup_song(next_song_1_index)


func _on_next_song_2_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		setup_song(next_song_2_index)
