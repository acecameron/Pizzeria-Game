extends Control

#func _ready() -> void:
#	update_happiness(40)

func update_money(new_money: int):
	$inventory_and_stats/main_stats/money/actual_money/value.text = str(new_money)

func update_happiness(new_happiness: int):
	$inventory_and_stats/main_stats/happiness/happiness_bar.value = new_happiness
