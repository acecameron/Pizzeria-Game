extends "res://npc.gd"

var direction : int = 1
var leaving_point : Vector2

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#velocity.x = SPEED
	if stopped:
		velocity = Vector2.ZERO
	else:
		velocity.x = SPEED * direction
	move_and_slide()
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("CashRegister"):
		stopped = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("CashRegister"):
		$TimerWaitForCashier.start()
		stopped = true


func leave(satisfied: bool = false) -> void:
	direction = -1
	stopped = false

func _on_timer_wait_for_cashier_timeout() -> void:
	$Sprite2D.flip_h = true
	leave()

func give_order() -> String:
	var order : String = "Basic pizza"
	$TimerWaitForCashier.stop()
	return order
