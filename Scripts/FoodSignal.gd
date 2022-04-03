extends Node

signal food_eated

func _on_food_area_entered(area):
	if(area.name == "head"):
		emit_signal("food_eated")

