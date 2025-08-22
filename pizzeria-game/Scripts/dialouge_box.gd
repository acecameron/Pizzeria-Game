extends Control

var dialogues = {}   # Loaded JSON data
var current_group = ""
var current_speaker = ""
var current_index = 0

@onready var name_label = $HBoxContainer/Name
@onready var dialogue_label = $HBoxContainer/Text


	
func _ready():
	load_dialogues("res://Text/TestText.json")

func load_dialogues(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var data = JSON.parse_string(file.get_as_text())
		if typeof(data) == TYPE_DICTIONARY:
			dialogues = data
		else:
			push_error("Failed to parse JSON dialogue file.")

# Example: start_dialogue("Dialogue1", "Name1")
func start_dialogue(group: String, speaker: String):
	if dialogues.has(group) and dialogues[group].has(speaker):
		current_group = group
		current_speaker = speaker
		current_index = 0
		show_text()
		show()
	else:
		push_error("No dialogue found for " + group + " -> " + speaker)

func show_text():
	var lines = dialogues[current_group][current_speaker]
	if current_index < lines.size():
		dialogue_label.text = lines[current_index]
		name_label.text = current_speaker
	else:
		hide()  # End of dialogue

func next_line():
	current_index += 1
	show_text()

func _input(event):
	if visible and event.is_action_pressed("interaction"):
		next_line()
