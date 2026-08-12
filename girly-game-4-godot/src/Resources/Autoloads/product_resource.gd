class_name Product
extends Resource

@export var product_name : String = "Default Lolita Dress"
@export var description : String = "Buy this now :D"
@export var category : String = "lolita"
@export var accesory_type : String = "Dress"
@export var substyle : String = "sweet"
@export var featured : bool = false
@export var id : int = -1

@export var keywords : Array[String] = []

@export var textures_path : String = "res://import/Art/shop/ss/a_outfit/"

@export var color_set1 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]
@export var color_set2 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]
@export var color_set3 : Array[Color] = [Color.GREEN, Color.GREEN, Color.GREEN]

@export var default_color : Color = Color.RED

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
	for texture in texture_files:
		if not texture.ends_with(".png"):
			continue
		
		var texture_rect = TextureRect.new()
		texture = load(textures_path + texture)
		assert(texture != null, "This shit is null bro")
		
		texture_rect.texture = texture
		texture_rect.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
		list.append(texture_rect)
	
	#print("Product: %s, Textures %d" % [product_name, texture_files.size()])
	return list


func convert_colors_to_string():
	pass
