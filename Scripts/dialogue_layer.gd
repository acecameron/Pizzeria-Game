extends CanvasLayer

@onready var box = preload("res://dialouge_box.tscn")

func summon_dialogue_box(speaker: String, key: String) -> void:
	var box_to_key = box.instantiate()
	add_child(box_to_key)
	box_to_key.start_dialogue(speaker, key)
