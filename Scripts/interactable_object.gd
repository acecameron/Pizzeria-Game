extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("MainCharacter")):
		$Text_Intreact.show()


#Override this in every object when needed
func process(delta: float) -> void:
	pass

func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("MainCharacter")):
		$Text_Intreact.show()
