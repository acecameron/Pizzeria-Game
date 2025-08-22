extends "draggable_object.gd"

var sprite_path: String = "res://sprites/Draggable_Toppings/spr_mushroom_draggable/mushroom_draggable.png"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = load(sprite_path)
	if auto_drag_on_spawn:
		dragging = true
		drag_offset = global_position - get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
