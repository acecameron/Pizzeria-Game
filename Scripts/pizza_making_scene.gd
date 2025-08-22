extends Node2D

signal back_to_main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$CanvasLayer/ColorRect.z_index = -1
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	emit_signal ("back_to_main")
