extends Node2D

@export var number_of_toppings = 20
var topping : String = "Default"
var topping_object_path : String = ""

var TOPPING_SCENE = preload("res://Draggable_Ingdridients/draggable_object.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = str(number_of_toppings)
	pass
#func _init(topping: String, filePath: String) -> void:
	
#	assert(allowed_toppings.count(topping) > 0, "ERROR: Invalid argument")
#	topping_object_path = filePath
#	self.topping = topping
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_toppings(toppings: int) -> void:
	if toppings <= 0:
		return
	number_of_toppings += toppings

func create_topping() -> void:
	var topping = TOPPING_SCENE.instantiate()
	topping.global_position = get_global_mouse_position()
	topping.z_index = 2
	print(topping.z_index)
	
	# Add it to the game layer — NOT the spawner
	
	get_parent().get_parent().add_child(topping)
	number_of_toppings -= 1
	$Label.text = str(number_of_toppings)

	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if number_of_toppings == 0:
			return
		create_topping()
		
