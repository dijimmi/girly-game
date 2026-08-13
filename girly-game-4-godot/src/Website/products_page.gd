class_name ShopPage
extends PanelContainer

@export var products_list : VBoxContainer
@export var products_list_scroll : ScrollContainer
@export var view_product_page : ViewProductPage
@export var category_scene : PackedScene
@export var featured_products : PanelContainer

signal product_clicked_from_category(product)

var categories_names = []
var curr_search = ""
var unique_products = []

var state_idx = {
	ProductInfo.SHOP_PAGE_SEARCH : -1,
	ProductInfo.SHOP_PAGE_BUY : -1,
	ProductInfo.FEATURED_PAGE : -1,
}

var states = {
	ProductInfo.SHOP_PAGE_SEARCH : [],
	ProductInfo.SHOP_PAGE_BUY : [],
	ProductInfo.FEATURED_PAGE : [],
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	
	add_category(ProductInfo.FEATURED)
	
	for product in ProductInfo.products:
		if not product.category in categories_names:
			categories_names.append(product.category)
			add_category(product.category)


func load_state(page: String, from_undo: bool) -> void:
	var i = state_idx[page]
	
	if from_undo:
		if i > 0:
			i -= 1
	else:
		if i < states[page].size() - 1:
			i += 1
	
	state_idx[page] = i
	
	if page == ProductInfo.SHOP_PAGE_SEARCH:
		var state = states[page][i]
		clear_search_results()
		add_category(state, "keyword")
	
	elif page == ProductInfo.SHOP_PAGE_BUY:
		var state = states[page][i]
		view_product_page.setup_page(state[0], state[1])
	
	elif page == ProductInfo.FEATURED_PAGE:
		show_featured()


func save_state(page : String, prev_count : int):
	await get_tree().process_frame
	
	if page == ProductInfo.SHOP_PAGE_SEARCH:
		if prev_count != states[page].size():
			state_idx[page] = prev_count - 1
			states[page].resize(prev_count)
			print("DISCREPANCY")
		
		states[page].append(curr_search)
		state_idx[page] += 1
		
	elif page == ProductInfo.SHOP_PAGE_BUY:
		if prev_count != states[page].size():
			state_idx[page] = prev_count - 1
			states[page].resize(prev_count)
			print("DISCREPANCY")
		
		states[page].append(view_product_page.get_state())
		state_idx[page] += 1
		
	elif page == ProductInfo.FEATURED_PAGE:
		pass


func _on_product_clicked_from_thumbnail(product):
	product_clicked_from_category.emit(product)


func clear_search_results(delete : bool = true) -> Array[ProductCategory]:
	var list : Array[ProductCategory] = []
	
	for cat : ProductCategory in products_list.get_children():
		list.append(cat)
		if delete:
			cat.queue_free()
	
	return list


func add_category(category_name : String, mode : String = "category"):
	var new_cat = category_scene.instantiate()
	new_cat.set_category(ProductInfo.make_clickable(new_cat.category_name, category_name))
	new_cat.product_clicked_from_thumbnail.connect(_on_product_clicked_from_thumbnail)
	
	# setup functions for the category scene
	if mode == "category":
		new_cat.add_products_by_category()
	elif mode == "keyword":
		# this shit is not gonna work soon enough cuz the category name is not
		# gonna be the same as the keyword which is what im using here
		
		curr_search = category_name
		new_cat.add_products_by_keywords(category_name)
		
	if category_name == ProductInfo.FEATURED:
		_add_featured_category(new_cat)
	else:
		products_list.add_child(new_cat)


func _add_featured_category(category_node : Container):
	category_node.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	category_node.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	featured_products.add_child(category_node)


func show_featured():
	products_list_scroll.visible = false
	view_product_page.visible = false
	
	featured_products.visible = true


func hide_all_products():
	featured_products.visible = false
	
	var list = get_all_products()
	
	for product in list:
		product.visible = false


func show_all_products():
	products_list_scroll.visible = true
	
	var list = get_all_products()
	
	for product in list:
		product.visible = true


func get_all_products():
	var list = []
	for category in products_list.get_children():
		for product in category.get_products():
			list.append(product)
		
	return list


func get_categories():
	var list = []
	for category in products_list.get_children():
		list.append(category)
		
	return list
