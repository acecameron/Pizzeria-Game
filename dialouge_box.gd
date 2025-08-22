extends Control

const CHAR_READ_RATE = 0.05

@onready var name_text := $HBoxContainer/Start
@onready var text_label := $HBoxContainer/Text
@onready var text := []
var number := 0

func _ready() -> void:
	hide_textbox()
	add_text(text[number])

func hide_textbox() -> void:
	name_text.text = ""
	
func add_text(number: int) -> void:
	return
	
	
	
	
