extends Node

var music: AudioStreamPlayer
var SFX: AudioStreamPlayer

var music_on = true
var sfx_on = true

var music_time
var started = false
var playing = false

var master_volume : float = 0.0
var music_volume : float = -20.0
var sfx_volume : float = 0.0

@export var sfx : Dictionary[String, AudioStream] = {}
@export var music_array : Dictionary[String, AudioStreamMP3] = {
	"main menu" : load("res://import/Music/Dijimmi_LearningJapanese_G maj_96.mp3"),
	"scene1" : null,
	"scene2" : load("res://import/Music/Dijimmi_VN-Opening_82.mp3"),
	"cutscene fashion" : load("res://import/Music/Dijimmi_VN-Reunion_84.mp3")
}
func load_music(cue : String):
	if cue in music_array.keys():
		_change_music(music_array[cue])

func _ready() -> void:
	#EventBus.music_started.connect(resume_music)
	EventBus.music_stopped.connect(_pause_music)
	EventBus.load_scene.connect(load_music)
	_instance_music()
	#set_stream(music_file)
func _process(_delta: float) -> void:
	if music.stream == null:
		return;
	if music.get_playback_position() + 0.1 > music.stream.get_length():
		music.play()

#___________MUSIC______________#
func _instance_music():
	var children = get_children()
	for child in children:
		child.queue_free()
	music = AudioStreamPlayer.new()
	music.process_mode = Node.PROCESS_MODE_ALWAYS
	music.bus = "Music"
	add_child(music)
func _set_stream(audio: AudioStream):
	music.stream = audio
var musicTween: Tween
func _resume_music():
	if music_time != null and !playing:
		music.play(music_time)
		playing = true
	music.stream_paused = false
	musicTween = create_tween()
	musicTween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	musicTween.tween_property(music, "volume_db", 0.0, 0.1)
func _pause_music():
	musicTween = create_tween()
	musicTween.tween_property(music, "volume_db", -31.0, 0.3)
	
	await musicTween.finished
	
	music.stream_paused = true
	music_time = music.get_playback_position()
	playing = false
func _play_music():
	if !music_on:
		return
	music.play()
	print("music play!", music.stream)
	started = true
func _change_music(audio: AudioStream):
	if music.stream == null:
		music_time = 0.0
		playing = false
		_set_stream(audio)
		_resume_music()
	else:
		_pause_music()
		await musicTween.finished
		_set_stream(audio)
		_resume_music()
func _play_or_resume_music():
	if started:
		_resume_music()  
	else:
		_play_music()
#____________SFX_______________#

func play_sfx(audio_player : AudioStreamPlayer, sound : AudioStream) -> void:
	audio_player.stream = sound
	audio_player.bus = "SoundEffects"
	audio_player.pitch_scale = randf_range(0.98,1.02)
	audio_player.play()
func play_random_sfx(audio_player : AudioStreamPlayer, sounds : Array[AudioStream]) -> void:
	var sound = sounds.pick_random()
	play_sfx(audio_player, sound)
