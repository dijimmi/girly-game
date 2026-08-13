@warning_ignore_start("unused_signal")
extends Node
#----EventBus.gd----
signal open_dictionary

signal name_selected

signal minigame_start(meta : String)
signal minigame_end
signal minigame_round_end

signal load_scene(cue : String)

signal unlock_word(word : String)
