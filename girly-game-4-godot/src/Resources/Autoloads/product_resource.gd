class_name Product
extends Resource

@export var product_name : String = "Default Lolita Dress"
@export var description : String = "Buy this now :D"
@export var category : String = "lolita"
@export var accesory_type : String = "Dress"
@export var substyle : String = "sweet"
@export var featured : bool = true
@export var id : int = -1

@export var keywords : Array[String] = []

@export var base_texture : Texture2D = preload("res://import/Art/ShopIcons/a_outfit_base.png")
@export var tint_texture : Texture2D = preload("res://import/Art/ShopIcons/a_outfit_tint.png")
@export var top_texture : Texture2D = preload("res://import/Art/ShopIcons/a_outfit_top.png")

@export var base_colors : Array[Color] = [Color.WHITE]
@export var tint_colors : Array[Color] = [Color.WHITE]
@export var top_colors : Array[Color] = [Color.WHITE]


func get_keywords():
	var keyword_list = []
	for word in keywords:
		keyword_list.append(word)
	
	keyword_list.append(product_name)
	keyword_list.append(category)
	keyword_list.append(substyle)
	
	return keyword_list
