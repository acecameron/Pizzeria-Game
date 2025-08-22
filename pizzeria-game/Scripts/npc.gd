extends CharacterBody2D


const SPEED = 50
var target_position : Vector2
var stopped := false

func _ready() -> void:
	print(global_position)
	
func _initialize(sprite_path: String):
	
	print("Initialized")
	$Sprite2D.texture = load(sprite_path)
	
func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#velocity.x = SPEED
	
	if stopped:
		velocity = Vector2.ZERO
	else:
		velocity.x = SPEED
	move_and_slide()
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	stopped = true
