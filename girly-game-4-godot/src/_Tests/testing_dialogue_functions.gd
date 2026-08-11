extends Node2D


var a = "あかさたなはまやらわ"
var i = "いきしちにひみり"
var u = "うくすつぬふむゆる"
var e = "えけせてねへめれ"
var o = "おこそとのほもよろをん"
func _ready() -> void:
	Dialogue.start_minigame(a+i, 1)
