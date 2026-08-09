extends Node

const FEATURED = "Featured Products"

var products = [
	{
		"name": "Girly Wolf",
		"texture": preload("res://image.png"),
		"category": "lolita",
		"featured": true,
		
		"base_texture": preload("res://import/Art/ShopIcons/a_outfit_base.png"),
		"tint_texture": preload("res://import/Art/ShopIcons/a_outfit_tint.png"),
		"top_texture": preload("res://import/Art/ShopIcons/a_outfit_top.png"),
		
		"base_colors": [Color.WHITE],
		"tint_colors": [Color.LIGHT_BLUE],
		"top_colors": [Color.BLACK],
	},
	{
		"name": "Not so girly Wolf",
		"texture": preload("res://image.png"),
		"category": "decora",
		"featured": true,
		
		"base_texture": preload("res://import/Art/ShopIcons/a_outfit_base.png"),
		"tint_texture": preload("res://import/Art/ShopIcons/a_outfit_tint.png"),
		"top_texture": preload("res://import/Art/ShopIcons/a_outfit_top.png"),
		
		"base_colors": [Color.WHITE],
		"tint_colors": [Color.LIGHT_BLUE],
		"top_colors": [Color.BLACK],
	},
		{
		"name": "manly Wolf",
		"texture": preload("res://image.png"),
		"category": "decora",
		"featured": false,
		
		"base_texture": preload("res://import/Art/ShopIcons/a_outfit_base.png"),
		"tint_texture": preload("res://import/Art/ShopIcons/a_outfit_tint.png"),
		"top_texture": preload("res://import/Art/ShopIcons/a_outfit_top.png"),
		
		"base_colors": [Color.WHITE],
		"tint_colors": [Color.LIGHT_BLUE],
		"top_colors": [Color.BLACK],
	}
]
