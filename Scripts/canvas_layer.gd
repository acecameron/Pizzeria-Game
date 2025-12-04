extends CanvasLayer

@onready var camera = get_viewport().get_camera_2d()
@onready var box = preload("res://dialouge_box.tscn")

func summon_dialogue_box(speaker: String, key: String) -> void:
	var box_to_key = box.instantiate()
	add_child(box_to_key)
	box_to_key.start_dialogue(speaker, key)
	

func summon_dialogue_box_number(speaker: String, key: String, index: int) -> void:
	var box_to_key = box.instantiate()
	add_child(box_to_key)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_pizza_ui()
	summon_dialogue_box("Dialogue1","Name1:")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("inventory_open_and_close")):
		if ($Control.visible):
			$Control.hide()
		else:
			$Control.show()
	
func hide_pizza_ui() -> void:
	$pizza_making_scene.hide()

func show_pizza_ui() -> void:
	$pizza_making_scene.show()
	pass
