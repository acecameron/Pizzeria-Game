extends Node2D

var state := 0 #States are: 
				#0: Can accept either Red or White sauce
				#1: Can accept cheese
				#2: Can accept any topping so long as it's not been added
#The number of ingridients for each state. 
const states_ingridients_num :={
	0: 1,
	1: 1,
	2: 7
}
var ingridients_of_current_state = 0
var accepts_ingridients := true 
#Add more recepipes here
const recipies := {
		"Basic": ["Red Sauce", "Cheese", "Mushroom", "Pepperoni"],
		1: []
	}


#Ingridients for each state of the pizza. 
#Important! There is not spelling mistake in "Sauce White". It is the way it is because the group 
#order in Godot in alphabetical. White Sauce would've gone after "Toppings", so it's renamed to
# Sauce White
const ingridients_for_states = {
	0: ["Red Sauce", "Sauce White"],
	1: ["Cheese"],
	2: ["Bacon", "Mushroom", "Mincemeat", "Pepperoni", "Pineapple", "Shrimp", "Tomato"]
}

#Current state ingridients array. Will be used for scanning whether
var current_state_ingridients := []
#An array for all the ingridients added so far.
var all_ingridients := []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_state_ingridients = ingridients_for_states[0]
	var left = [&"Red Sauce"]
	var right = ["Red Sauce"]
	print("left equals right:" + str(left == right))
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _on_pizza_area_area_entered(area: Area2D) -> void:
	if (!area.is_in_group("Toppings")):
		return
	if (!accepts_ingridients):
		print("Recepie has been matched. Cannot add anymore toppings")
		return
		
	var ingridient_name := area.get_groups()[0]
	
	if (!current_state_ingridients.has(ingridient_name)):
		print(area.get_groups()[0] + " is not acceptable in the current state.\nCurrent state is: " + str(state)
				+ "\nAcceptable ingridients are: " + str(current_state_ingridients))
		return
	
	if (all_ingridients.has(ingridient_name)):
		print(area.get_groups()[0] + " is already on the pizza. Deleting")
		area.free()
		return
		
	all_ingridients.append(ingridient_name)
	$Toppings.add_topping(ingridient_name)
	ingridients_of_current_state += 1
	check_and_update_state()
	accepts_ingridients = !recipie_match()
	print("Accepting ingridients is: " + str(accepts_ingridients))

func recipie_match() -> bool:
	print(str(all_ingridients))
	print(str(recipies["Basic"]))

	for recipe in recipies.values():
		if recipe.size() != all_ingridients.size():
			continue

		var match_found := true
		for i in range(recipe.size()):
			if recipe[i] != all_ingridients[i]:
				match_found = false
				break

		if match_found:
			return true

	return false

func check_and_update_state() -> void:
	if ingridients_of_current_state == states_ingridients_num[ingridients_of_current_state]:
		if state < 2:
			state += 1
		current_state_ingridients = ingridients_for_states[state]
		ingridients_of_current_state = 0

func _on_new_pizza_button_pressed() -> void:
	current_state_ingridients = ingridients_for_states[0]
	state = 0
	all_ingridients = []
	$Toppings.remove_toppings()
	accepts_ingridients = true
