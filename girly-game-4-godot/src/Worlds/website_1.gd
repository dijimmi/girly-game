extends Control

@export var my_vbox : VBoxContainer
@export var url: LineEdit

@export var address_bar : PanelContainer
@export var task_bar : PanelContainer

@export var shop_page_seach_bar : PanelContainer

@export var shop_page : ShopPage
@export var products_list_page : ScrollContainer
@export var view_product_page : HBoxContainer
@export var product_big_view : VBoxContainer
@export var featured_page : PanelContainer
@export var ads : VBoxContainer

@export var homepage : PanelContainer
@export var honse_page: PanelContainer

@export var undo : Button
@export var redo : Button

@export var chat_layer : CanvasLayer
@export var chat_screen : ChatScreen

var pages : Dictionary[String, Array] = {}

var stack_idx = 0

var stack = [
	ProductInfo.HOME
]

var active_page : String = ProductInfo.HOME


var web_score = 0
var curr_level = ProductInfo.Level.ONE

# USE THIS SIGNAL TOWARDS THE LEVEL MANAGER OR WHATEVER :)
signal close_website_and_get_score(score : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pages = {
		ProductInfo.HOME:             [homepage],
		ProductInfo.SHOP_PAGE_SEARCH: [shop_page, shop_page_seach_bar, products_list_page],
		ProductInfo.FEATURED_PAGE:    [shop_page_seach_bar, shop_page, featured_page],
		ProductInfo.SHOP_PAGE_BUY:    [shop_page_seach_bar, shop_page, view_product_page],
		ProductInfo.HONSE:            [honse_page],
	}
	
	init_products()
	
	shop_page_seach_bar.search_prompted.connect(_on_search_prompted)
	shop_page_seach_bar.pressed_logo_from_search_bar.connect(_on_website_1_pressed)
	shop_page.product_clicked_from_category.connect(view_product)
	
	change_page(ProductInfo.HOME)


func update_score(score_amt):
	web_score += score_amt
	
	print("Current Score: ", str(web_score))


func init_products():
	const path = "res://src/Resources/Products/"
	
	var files = DirAccess.get_files_at(path)
	var id = 0
	for file_name in files:
		var loaded_product : Product = load(path + file_name)
		loaded_product.id = id
		if loaded_product.level == curr_level:
			ProductInfo.products.append(loaded_product)


func view_product(dict, index = 0, _from_redo = false):
	change_page(ProductInfo.SHOP_PAGE_BUY)
		
	view_product_page.setup_page(dict, index)
	
	print("normal view pressed: %s" % stack_idx)
	
	toggle_undo_and_redo()


func view_webpage():
	shop_page.visible = true
	products_list_page.visible = true
	shop_page_seach_bar.visible = true
	
	
	view_product_page.visible = false
	homepage.visible = false


func toggle_undo_and_redo():
	pass
	#redo.disabled = stack_idx >= (stack.size() - 1)
	#undo.disabled = stack_idx < 0


func change_page(page : String, new = true):
	active_page = page
	if new:
		stack.resize(stack_idx + 1)
		save_state(page)
	
	for node in my_vbox.get_children():
		if node in pages[page] or node == address_bar or node == task_bar:
			node.visible = true
		else:
			node.visible = false
	
	for sub_node in shop_page.get_children():
		if sub_node in pages[page] or sub_node == ads:
			sub_node.visible = true
		else:
			sub_node.visible = false


func save_state(page):
	for node : Container in pages[page]:
		if node in my_vbox.get_children():
			if node.has_method("save_state"):
				node.save_state(page, stack.count(page))
				stack.append(page)
				stack_idx += 1
				
				print(stack)
				print("\n")
				print("state saved: ", page, "pages count: ", stack.count(page))
				return


func load_state(from_undo : bool):
	var page = stack[stack_idx]
	
	for node : Container in pages[page]:
		if node in my_vbox.get_children():
			if node.has_method("load_state"):
				node.load_state(page, from_undo)
				change_page(page, false)
				
				print("state loaded: ", page)
				return


func _on_undo_pressed() -> void:
	if stack_idx > 0:
		stack_idx -= 1
		load_state(true)
		
	print("undo pressed: %s" % stack_idx)


func _on_redo_pressed() -> void:
	if stack_idx < stack.size() - 1:
		stack_idx += 1
		load_state(false)
		
	print("redo pressed: %s" % stack_idx)


func _on_search_prompted(text):
	text = text.strip_edges().to_lower()
	shop_page.clear_search_results()
	shop_page.add_category(text, "keyword")
	
	change_page(ProductInfo.SHOP_PAGE_SEARCH)


func _on_website_1_pressed() -> void:
	change_page(ProductInfo.FEATURED_PAGE)


func _on_home_pressed() -> void:
	change_page(ProductInfo.HOME)


func _on_chat_pressed() -> void:
	chat_layer.visible = !chat_layer.visible
	
	if chat_layer.visible:
		chat_screen.load_conversation(Constants.VERONICA_CHAT)
		chat_screen.continue_conversation(Constants.VERONICA_CHAT)


func _on_view_product_page_buy_product(product: Product) -> void:	
	if product.winner:
		if product.level == ProductInfo.Level.ONE:
			update_score(500)
		elif product.level == ProductInfo.Level.TWO:
			update_score(750)
		elif product.level == ProductInfo.Level.THREE:
			update_score(1000)
	elif product.mid_winner:
		if product.level == ProductInfo.Level.ONE:
			update_score(250)
		elif product.level == ProductInfo.Level.TWO:
			update_score(375)
		elif product.level == ProductInfo.Level.THREE:
			update_score(500)
	else:
		update_score(0)
	
	print("New score: ", str(web_score))
	close_website_and_get_score.emit(web_score)
	#TODO: ADD FUNCTION TO GO BACK TO DIALOGIC SCENE AND UPDATE OVERALL SCORE


func _on_chat_screen_hint_received(_hint_num: Variant) -> void:
	if curr_level == ProductInfo.Level.ONE:
		update_score(-250)
	elif curr_level == ProductInfo.Level.TWO:
		update_score(-325)
	elif curr_level == ProductInfo.Level.THREE:
		update_score(-500)
	else:
		update_score(0)


func _on_url_text_submitted(new_text: String) -> void:
	
	if new_text.to_lower().contains("honse"):
		url.text = "honse!.com"
		change_page(ProductInfo.HONSE)

@export var music_layer: CanvasLayer


func _on_music_player_pressed() -> void:
	music_layer.visible = !music_layer.visible
