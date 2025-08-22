extends CharacterBody2D

@export var target: Vector2
@export var take_order = false

var is_making_pizza := false

var min_happiness := 0.0
var max_happpiness := 100.0
@export var happiness := clampf(min_happiness, 0.0, max_happpiness)
const happiness_step = 0.5
const SPEED = 300.0

#Update later: Load from a save file



func ready() -> void:
	$Sprite2D.z_index = 1
	happiness += 101
	print("Happiness: " + str(happiness))
	$Happiness_Decrease_Timer.start()
	
func move() -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if (!take_order and !is_making_pizza):
		if direction:
			velocity.x = direction * SPEED
			$Sprite2D.flip_h = direction < 0  # Flip when moving left
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()

func _physics_process(delta: float) -> void:
	move()
	#else:
	#	move_to_target(target, 100, delta)

func _add_pizza_to_carry(pizza_path: String):
	pass

func move_to_target(target: Vector2, speed: float, delta: float):
	position = position.move_toward(target, speed * delta)
	
func stopped_making_pizza() -> void:
	is_making_pizza = false

func started_making_pizza() -> void:
	is_making_pizza = true


func _on_happiness_decrzzease_timer_timeout() -> void:
	happiness -= happiness_step
	happiness = clampi(min_happiness, 0.0, max_happpiness)
	print("Happiness: " + str(happiness))
