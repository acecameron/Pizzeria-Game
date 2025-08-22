extends Container


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Container/AnimatedSprite2D.position += Vector2(0,60)
	#$Pizza_Making_Scene.position -= Vector2(-100,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
