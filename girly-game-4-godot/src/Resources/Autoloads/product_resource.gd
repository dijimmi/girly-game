class_name Product
extends Resource

@export var product_name : String = "Default Lolita Dress"
@export var id : int = -1
@export var level : ProductInfo.Level = ProductInfo.Level.FOUR
@export var score_count : int

@export_category("Description")
@export var description : String = "今すぐこれを購入してください"
@export var category : String = "ロリータ"
@export var accesory_type : String = "ドレス"
@export var substyle : String = "あまろりー"

@export_category("Booleans")
@export var featured : bool = false
@export var winner : bool = false
@export var mid_winner : bool = false
@export var loser : bool = true

@export_category("Keywords")
@export var keywords : Array[String] = []

@export_category("Texture Directory")
@export var textures : Array[Texture] = []

@export_category("Colors")
@export var color_set1 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]
@export var color_set2 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]
@export var color_set3 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]
@export var color_set_count = 3

const default_color : Color = Color.RED


func get_keywords():
	var keyword_list = []
	for word in keywords:
		keyword_list.append(word)
	
	keyword_list.append(product_name)
	keyword_list.append(category)
	keyword_list.append(substyle)
	keyword_list.append(accesory_type)
	keyword_list.append("all")
	
	return keyword_list


func get_texture_rect_list() -> Array[TextureRect]:
	
	var list : Array = []
	
	for texture : Texture in textures:
		var texture_rect = TextureRect.new()
	
		texture_rect.texture = texture
		texture_rect.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
		list.append(texture_rect)
	
	return list


func convert_colors_to_string():
	pass
