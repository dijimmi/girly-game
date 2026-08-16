extends DialogicBackground

const _2_SPECIAL_ART_COFFEE_AO_EYE_2_P_NEUTRAL = preload("uid://cp46s88l4equc")
const _2_SPECIAL_ART_COFFEE_AO_HAPPY = preload("uid://d3tvda7833e2p")
const _2_SPECIAL_ART_COFFEE_AYU_EYE_3_P_WORRIED = preload("uid://crl3vea48i7lc")
const _2_SPECIAL_ART_COFFEE_AYU_EYE_4_P_HAPPY = preload("uid://q3tc4wsib0eh")
const _2_SPECIAL_ART_COFFEE_AYU_EYE_5_HAPPY = preload("uid://dmvt0yis5xqq")
const _2_SPECIAL_ART_COFFEE_AYU_EYE_P_NEUTRAL = preload("uid://23tg08ucnyeq")
const _2_SPECIAL_ART_COFFEE_AYU_EYE_SMILE = preload("uid://bqjvg537evmap")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FA.change_fullart2.connect(change_expressions)
	change_expressions("", "ph")
	
func change_expressions(who, expression):
	if who == "Aoi":
		if not $ExpressionAoi.visible:
			$Sprite2D2.visible = true
			$ExpressionAoi.visible = true
		if "n" in expression.to_lower() or "p" in expression.to_lower():
			$ExpressionAoi.texture = _2_SPECIAL_ART_COFFEE_AO_EYE_2_P_NEUTRAL
		elif "h" in expression.to_lower():
			$Expression.texture = _2_SPECIAL_ART_COFFEE_AO_HAPPY
	else:
		if "w" in expression.to_lower():
			$Expression.texture = _2_SPECIAL_ART_COFFEE_AYU_EYE_3_P_WORRIED
		elif "ph" in expression.to_lower():
			$Expression.texture = _2_SPECIAL_ART_COFFEE_AYU_EYE_4_P_HAPPY
		elif "h" in expression.to_lower():
			$Expression.texture = _2_SPECIAL_ART_COFFEE_AYU_EYE_5_HAPPY
		elif "n" in expression.to_lower():
			$Expression.texture = _2_SPECIAL_ART_COFFEE_AYU_EYE_P_NEUTRAL
		elif "s" in expression.to_lower():
			$Expression.texture = _2_SPECIAL_ART_COFFEE_AYU_EYE_SMILE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
