class_name Product
extends Resource

@export var product_name : String = "Default Lolita Dress"
@export var id : int = -1

@export_category("Description")
@export var description : String = "今すぐこれを購入してください"
@export var category : String = "ロリータ"
@export var accesory_type : String = "ドレス"
@export var substyle : String = "あまろりー"

@export_category("Booleans")
@export var featured : bool = false
@export var winner : bool = false

@export_category("Keywords")
@export var keywords : Array[String] = []

@export_category("Texture Directory")
@export_dir var textures_path : String = "res://import/Art/shop/ss/a_outfit/"

@export_category("Colors")
@export var color_set1 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]
@export var color_set2 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]
@export var color_set3 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]

const default_color : Color = Color.RED

func get_keywords():
	var keyword_list = []
	for word in keywords:
		keyword_list.append(word)
	
	keyword_list.append(product_name)
	keyword_list.append(category)
	keyword_list.append(substyle)
	keyword_list.append(accesory_type)
	
	return keyword_list


func get_texture_rect_list() -> Array[TextureRect]:
	var list : Array = []
	
	var texture_files = DirAccess.get_files_at(textures_path)
	for texture : String in texture_files:
		if not texture.ends_with(".png"):
			continue
		if texture.contains("base_"):
			continue
		
		var texture_rect = TextureRect.new()
		var loaded_texture = load("%s/%s" % [textures_path, texture])
		assert(loaded_texture != null, "This shit is null bro")
		
		texture_rect.texture = loaded_texture
		texture_rect.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
		list.append(texture_rect)
	
	#print("Product: %s, Textures %d" % [product_name, texture_files.size()])
	return list


func convert_colors_to_string():
	pass
