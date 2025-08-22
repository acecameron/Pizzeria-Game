extends Node

class Queue:
	var customers = []
	var index: int = 0
	
	func add_customer(customer: CharacterBody2D) -> bool:
		if (customer.get_name() != "customer"):
			return false
		customers.append(customer)
		return true
	
	func advance_queue():
		index += 1
	
	func return_first_in() -> CharacterBody2D:
		return customers[index]
