extends Control

var dialogues = {}   # Loaded JSON data
var current_group = ""
var current_speaker = ""
var current_index = 0

@onready var name_label = $HBoxContainer/Name
@onready var dialogue_label = $HBoxContainer/Text
@onready var sound_player = $AudioStreamPlayer2D
@onready var type_timer = $TypeTimer   

var full_text := ""
var char_index := 0
var typing := false


func _ready():
	load_dialogues("res://Text/TestText.json")
	type_timer.wait_time = 0.05  # Adjust typing speed (lower = faster)


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

func start_dialogue_index(group: String, speaker: String, index: String):
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
		full_text = lines[current_index]
		name_label.text = current_speaker
		dialogue_label.text = ""    # Clear before typing
		char_index = 0
		typing = true
		type_timer.start()
	else:
		hide()  # End of dialogue


func _on_type_timer_timeout():
	if char_index < full_text.length():
		dialogue_label.text += full_text[char_index]
		char_index += 1
		sound_player.play()
	else:
		type_timer.stop()
		typing = false


func next_line():
	if typing:
		# Skip typing and show the full line instantly
		type_timer.stop()
		dialogue_label.text = full_text
		typing = false
	else:
		# Move to next line
		current_index += 1
		show_text()


func _input(event):
	if visible and event.is_action_pressed("interaction"):
		next_line()
