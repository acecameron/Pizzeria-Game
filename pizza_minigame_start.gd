extends "interactable_object.gd"

var player_here := false
signal change_to_minigame

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("MainCharacter")):
		$Text_Intreact.show()
		player_here = true


#Override this in every object when needed
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interaction") and player_here:
		print("Player interacted with me")
		emit_signal("change_to_minigame")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("MainCharacter")):
		$Text_Intreact.show()
		player_here = false
