extends Sprite2D

var texture_path_s: String = "res://sprites/spr_pizza_sauce_red/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png"
func _init(texture_path: String) -> void:
	texture = load(texture_path_s)
	scale = Vector2(10,10)
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
func _ready() -> void:
	texture = load(texture_path_s)
	scale = Vector2(10,10)
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	
