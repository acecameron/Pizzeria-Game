extends Node2D

const NPC_PATH = "res://customer.tscn"
var NCP_DEFAULT_SPRITE = "res://sprites/spr_MC/ca7db15b-59c3-4b60-b0c5-0671a815d79d.png"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MainCharacter.z_index = 1
	#$MainCharacter/Camera2D.zoom = Vector2(1,1)
	#$MainCharacter.target = Vector2($CashRegister/TakeOrderSpot.)
	var npc_scene = preload(NPC_PATH)
	var npc = npc_scene.instantiate()
	npc.z_index = 0
	npc._initialize(NCP_DEFAULT_SPRITE)  # Pass sprite path or data needed for setup
	npc.global_position = $SpawnPoint.global_position
	npc.scale = Vector2(6,6)
	add_child(npc)
	
	print($SpawnPoint.global_position)
	print(npc.global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ($CanvasLayer/pizza_making_scene.visible):
		if (Input.is_action_just_pressed("Exiting_Minigame")):
			_on_pizza_making_scene_back_to_main()


func _on_cash_register_body_entered(body: Node2D) -> void:
	#print("Player entered!")
	pass
	
func _on_cash_register_initiate_order() -> void:
	print("Order initiated")
	$MainCharacter.take_order = true


func _on_pizza_minigame_start_change_to_minigame() -> void:
	$CanvasLayer.show_pizza_ui()
	$MainCharacter.started_making_pizza()


func _on_pizza_making_scene_back_to_main() -> void:
	$CanvasLayer.hide_pizza_ui()
	$MainCharacter.stopped_making_pizza()
