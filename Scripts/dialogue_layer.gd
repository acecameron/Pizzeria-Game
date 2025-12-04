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
