extends CanvasLayer

@onready var player = $"../MainCharacter"  # adjust path to your player
@onready var camera = get_viewport().get_camera_2d()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_pizza_ui()


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
