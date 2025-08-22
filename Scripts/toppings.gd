extends Node2D

# Ingredient sprite paths
#Important! Sauce White is not a typo. It is intentionally written as such due to how Godot
# organizes its groups.
const TOPPING_SPRITES := {
	"Red Sauce": "res://sprites/spr_pizza_sauce_red/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Sauce White": "res://sprites/spr_pizza_sauce_white/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Cheese": "res://sprites/spr_pizza_topping_mozarella/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Bacon": "res://sprites/spr_pizza_topping_bacon/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Mincemeat": "res://sprites/spr_pizza_topping_mincemeat/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Mushroom": "res://sprites/spr_pizza_topping_mushroom/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Pepperoni": "res://sprites/spr_pizza_topping_pepperoni/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Pineapple": "res://sprites/spr_pizza_topping_pineapple/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Shrimp": "res://sprites/spr_pizza_topping_shrimp/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png",
	"Tomato": "res://sprites/spr_pizza_topping_tomato/5ddeef14-e2ae-4bf4-802b-5a56e5b39b78.png"
}

func add_topping(topping_name: String):
	if not TOPPING_SPRITES.has(topping_name):
		print("Unknown topping:", topping_name)
		return

	var sprite := Sprite2D.new()
	sprite.texture = load(TOPPING_SPRITES[topping_name])
	sprite.scale = Vector2(10,10)
	sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	sprite.name = topping_name
	add_child(sprite)
	
func remove_toppings() -> void:
	for node in get_children():
		node.free()
