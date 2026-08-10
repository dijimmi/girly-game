class_name Product
extends Resource

@export var product_name : String = "Default Lolita Dress"
@export var description : String = "Buy this now :D"
@export var category : String = "lolita"
@export var featured : bool = true

@export var base_texture : Texture2D = preload("res://import/Art/ShopIcons/a_outfit_base.png")
@export var tint_texture : Texture2D = preload("res://import/Art/ShopIcons/a_outfit_tint.png")
@export var top_texture : Texture2D = preload("res://import/Art/ShopIcons/a_outfit_top.png")

@export var base_colors : Array[Color] = [Color.WHITE]
@export var tint_colors : Array[Color] = [Color.WHITE]
@export var top_colors : Array[Color] = [Color.WHITE]
