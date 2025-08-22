extends Node2D

@export var money = 0

var customer_here = false
var player_here = false
var taking_order = false

signal initiate_order
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("interaction") and player_here and customer_here and !taking_order):
		taking_order = true
		emit_signal("initiate_order")
		print("Taking order")
		


func _on_order_area_body_entered(body: Node2D) -> void:
	if (body.is_in_group("MainCharacter")):
		player_here = true
		if (customer_here):
			$Label.show()  # extra hiding
			print("Ready to take an order") # Replace with function body.


func _on_customer_area_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Customer")):
		customer_here = true
		#print("Ready to take an order") # Replace with function body.


func _on_order_area_body_exited(body: Node2D) -> void:
	if (body.is_in_group("MainCharacter")):
		player_here = false
		$Label.hide()  # extra hiding


func _on_customer_area_body_exited(body: Node2D) -> void:
	print("CustomerLeft")
	if (body.is_in_group("Customer")):
		customer_here = false
		$Label.hide()  # extra hiding
	
