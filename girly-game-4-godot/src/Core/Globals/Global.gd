extends Node

var player_exp : Dictionary[String, float] ={
	"あ" : 0.0,
	"か" : 0.0,
	"さ" : 0.0,
	"た" : 0.0,
	"な" : 0.0, 
	"は" : 0.0,
	"ま" : 0.0,
	"や" : 0.0,
	"ら" : 0.0,
	"わ" : 0.0, 
	
	"い" : 0.0,
	"き" : 0.0,
	"し" : 0.0, 
	"ち" : 0.0,
	"に" : 0.0,
	"ひ" : 0.0,
	"み" : 0.0,
	"り" : 0.0,
	"う" : 0.0,
	"く" : 0.0,
	"す" : 0.0,
	"つ" : 0.0,
	"ぬ" : 0.0,
	"ふ" : 0.0,
	"む" : 0.0,
	"ゆ" : 0.0,
	"る" : 0.0,
	
	"え" : 0.0,
	"け" : 0.0,
	"せ" : 0.0,
	"て" : 0.0,
	"ね" : 0.0,
	"へ" : 0.0,
	"め" : 0.0,
	"れ" : 0.0,
	
	"お" : 0.0,
	"こ" : 0.0,
	"そ" : 0.0,
	"と" : 0.0,
	"の" : 0.0,
	"ほ" : 0.0,
	"も" : 0.0,
	"よ" : 0.0,
	"ろ" : 0.0,
	"を" : 0.0,
	"ん" : 0.0
}
func add_player_exp(key : String, value : float):
	if key in player_exp:
		player_exp[key] += value
func get_player_exp(key : String) -> float:
	var result : float = 0.0
	if key in player_exp:
		result = player_exp[key]
	return result

var can_pause : bool = true

var next_scene : String = ""
