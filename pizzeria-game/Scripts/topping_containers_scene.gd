extends Node2D

var sauce_con = preload("res://Draggable_Ingdridients/sauce_draggable.tscn")
var cheese_con = preload("res://Draggable_Ingdridients/cheese_draggable.tscn")
var olive_con = preload("res://Draggable_Ingdridients/olive_draggable.tscn")
var corn_con = preload("res://Draggable_Ingdridients/corn_draggable.tscn")
var mushroom_con = preload("res://Draggable_Ingdridients/mushroom_draggable.tscn")

var containers:Array[PackedScene] = [sauce_con, cheese_con, olive_con, corn_con, mushroom_con]
var positions:Array[Marker2D] = [ $SauceSpawnPoint, $CheeseSpawnPoint, $OliveSpawnPoint, $CornSpawnPoint, $MushroomSpawnPoint]

var conts:Array 
# Called when the node enters the scene tree for the first time.
func summon_containers() -> void:
	for i in range(0, containers.size()):
		conts.append(containers[i].instantiate())
	for i in range(0, containers.size()):
		conts[i].global_position = positions[i]

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
