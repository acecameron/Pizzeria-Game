extends "interactable_object.gd"

var canvas_layer := get_parent().get_node("CanvasLayer")
var object_name := "TestObject"
var object_key := "MC"
var index := 0

func play_dialogue():
	canvas_layer.summon_dialogue_box()
	
