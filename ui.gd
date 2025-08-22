extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($Timer.wait_time)
	$Timer.start()
	#$Container/Container/AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$Container/Label.text = $Timer.wait_time
	#print($Timer.time_left)
	pass
	
func pizza_making_start() -> void:
	print("UI: pizza making start")
	$Container.hide()
#	$Pizza_Container.show()

func pizza_making_end() -> void:
	print("UI: pizza making end")
	$Container.show()
#	$Pizza_Container.hide()


func _on_pizza_making_scene_back_to_main() -> void:
	print("Minigame end")
	hide()
	pizza_making_end()


func _on_pizza_minigame_start_change_to_minigame() -> void:
	print("Minigame start")
	show()
	pizza_making_start()
