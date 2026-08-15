extends PanelContainer

@export var song_thumbnail: TextureRect
@export var song_name: RichTextLabel
@export var aritst_name: RichTextLabel

@export var song_time: HSlider
@export var current_song: AudioStreamPlayer
@export var song_list: VBoxContainer
@export var volume_slider: VSlider

var songs = [
	{
		"title": "結んだ末は (feat. カゼヒキ)",
		"artist": "あいすここあ",
		"image": preload("res://mu2.png"),
		"file": preload("res://import/Music/結んだ末は_mas.wav"),
	},
	{
		"title": "Website",
		"artist": "OWMG",
		"image": preload("res://icon.svg"),
		"file": preload("res://import/Music/Dijimmi_LearningJapanese_G maj_96.mp3"),
	},
]

var song_index = 0
var current_value = 0
var is_dragging = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	_init_volume_slider()
	setup_song(0, false)
	for song in songs:
		var btn = Button.new()
		var title : String = song["title"]
		title = song["title"].get_slice(" ", 0)
		if title != song['title']:
			title += "..."
		
		btn.text = title
		btn.pressed.connect(_on_song_pressed.bind(btn))
		song_list.add_child(btn)


func setup_song(index, play : bool = true):
	if index < 0 or index > songs.size() - 1:
		print("Song out of bounds")
		index = 0
	
	song_thumbnail.texture = songs[index]['image']
	song_name.text = songs[index]['title']
	aritst_name.text = songs[index]['artist']
	current_song.stream = songs[index]['file']
	song_time.max_value = current_song.stream.get_length()
	
	if play:
		current_song.play()


func _on_song_pressed(button : Button):
	var sname = button.text.replace("...", "")
	for i in songs.size():
		if sname in songs[i]['title']:
			setup_song(i)


func _process(delta: float) -> void:
	if current_song.is_playing() and not current_song.stream_paused:
		current_value = current_song.get_playback_position()
		song_time.value = current_value


func _on_song_time_value_changed(value: float) -> void:
	pass
	#if is_dragging: # this is to prevent constant jumps
		#current_song.seek(value)


func _on_play_pause_pressed() -> void:
	if current_song.playing:
		current_song.stream_paused = true
		current_value = current_song.get_playback_position()
	else:
		current_song.play(current_value)


func _on_song_time_drag_started() -> void:
	is_dragging = true
	current_song.stream_paused = true


func _on_song_time_drag_ended(value_changed: bool) -> void:
	is_dragging = false
	current_song.stream_paused = false
	if value_changed:
		current_song.seek(song_time.value)


func _on_back_pressed() -> void:
	if current_song.get_playback_position() < 2:
		song_index -= 1
		setup_song(song_index)
	else:
		current_value = 0
		current_song.seek(current_value)


func _on_forward_pressed() -> void:
	song_index += 1
	setup_song(song_index)
	
	
func _init_volume_slider() -> void:
	volume_slider.min_value = 0.0
	volume_slider.max_value = 1.0
	volume_slider.step = 0.01       # <--- CRUCIAL: Changing this from 1.0 to 0.01 fixes the jumping
	volume_slider.rounded = false
	
	volume_slider.set_meta("bus_index", AudioServer.get_bus_index("Music"))
	volume_slider.value_changed.connect(_on_volume_slider_value_changed)
	
	volume_slider.value = db_to_linear(
		AudioServer.get_bus_volume_db(volume_slider.get_meta("bus_index"))
	)


func _on_volume_slider_value_changed(val : float) -> void:
	AudioServer.set_bus_volume_db(
		volume_slider.get_meta("bus_index"),
		linear_to_db(val)
	)
