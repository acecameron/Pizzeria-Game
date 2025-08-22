extends "toping_container.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TOPPING_SCENE = preload("res://Draggable_Ingdridients/bacon_draggable.tscn")
	$Label.text = str(number_of_toppings)
