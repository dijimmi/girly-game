extends Node

var music: AudioStreamPlayer
var SFX: AudioStreamPlayer2D

var music_on = true
var sfx_on = true

var music_time
var started = false
var playing = false

var music_volume : float = -20.0

@export var sfx : Dictionary[String, AudioStream] = {}
@export var music_array : Dictionary[String, AudioStreamMP3] = {
	"main menu" : load("res://import/Music/Dijimmi_LearningJapanese_G maj_96.mp3"),
	"scene1" : null,
	"scene2" : load("res://import/Music/Dijimmi_VN-Opening_82.mp3"),
	"cutscene fashion" : load("res://import/Music/Dijimmi_VN-Reunion_84.mp3")
}

func _ready() -> void:
	#EventBus.music_started.connect(resume_music)
	EventBus.music_stopped.connect(pause_music)
	EventBus.load_scene.connect(load_music)
	_instance_music()
	#set_stream(music_file)

func _process(_delta: float) -> void:
	if music.stream == null:
		return;
	if music.get_playback_position() + 0.1 > music.stream.get_length():
		music.play()

func load_music(cue : String):
	
	if cue in music_array.keys():
		change_music(music_array[cue])

func _set_stream(audio: AudioStream):
	music.stream = audio

func _instance_music():
	var children = get_children()
	for child in children:
		child.queue_free()
	music = AudioStreamPlayer.new()
	music.process_mode = Node.PROCESS_MODE_ALWAYS
	music.bus = "Music"
	add_child(music)

var musicTween: Tween
func resume_music():
	print(music_time," ",!playing)
	if music_time != null and !playing:
		music.play(music_time)
		playing = true
	music.stream_paused = false
	musicTween = create_tween()
	musicTween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	musicTween.tween_property(music, "volume_db", music_volume, 0.1)

func pause_music():
	musicTween = create_tween()
	musicTween.tween_property(music, "volume_db", -31.0, 0.3)
	
	await musicTween.finished
	
	music.stream_paused = true
	music_time = music.get_playback_position()
	playing = false

func play_music():
	if !music_on:
		return
	music.play()
	print("music play!", music.stream)
	started = true

func change_music(audio: AudioStream):
	if music.stream == null:
		music_time = 0.0
		playing = false
		_set_stream(audio)
		resume_music()
	else:
		pause_music()
		await musicTween.finished
		_set_stream(audio)
		resume_music()
	
func reset_music():
	music_time = null
func play_or_resume_music():
	if started:
		resume_music()  
	else:
		play_music()
