extends Node2D

@export var number_of_toppings = 20

const TOPPING_SCENE = preload("res://Draggable_Ingdridients/draggable_object.tscn")

func update_ui() -> void:
	$Label.text = str(number_of_toppings)
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	print("I was born!")
	update_ui()

func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var topping = TOPPING_SCENE.instantiate()
		topping.global_position = get_global_mouse_position()
		# Add it to the game layer — NOT the spawner
		get_node("/root/").add_child(topping)
