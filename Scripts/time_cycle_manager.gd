extends Node

signal day_over

var hours: int = 9   # Start time at 6:00
var minutes: int = 0
var time_speed: float = 60.0  # 1 real second = 1 in-game minute


var _time_accumulator: float = 0.0

@onready var time_label = $"../CanvasLayer/UI_time/TimeBox/TimeLabel"
@onready var ampm_label = $"../CanvasLayer/UI_time/TimeBox/AM_PmLabel"

func _process(delta: float) -> void:
	_time_accumulator += delta * time_speed
	while _time_accumulator >= 60.0:
		_time_accumulator -= 60.0
		minutes += 1
		if minutes >= 60:
			minutes = 0
			hours += 1
			if hours >= 12:
				ampm_label.text = "PM"
			if hours >= 21:
				hours = 0
				day_over.emit()
	
	update_ui()

func update_ui():
	var display = "%02d:%02d" % [hours, minutes]
	time_label.text = display
