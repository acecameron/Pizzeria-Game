extends Area2D

var dragging := false
var drag_offset := Vector2.ZERO
var auto_drag_on_spawn := true  # Set to true when spawning

func _ready():
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))
	if auto_drag_on_spawn:
		dragging = true
		drag_offset = global_position - get_global_mouse_position()
	set_process_input(true)  # Enable _input()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			drag_offset = global_position - event.global_position
			get_viewport().set_input_as_handled()


func _on_mouse_entered():
	material.set_shader_parameter("show_outline", true)

func _on_mouse_exited():
	material.set_shader_parameter("show_outline", false)
func _input(event):
	# This captures global input even if the mouse is no longer over the object
	if dragging and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		dragging = false
		queue_free()

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() + drag_offset
