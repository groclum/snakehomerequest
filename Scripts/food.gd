extends Area2D


signal food_eaten

func _on_food_area_entered(area):
	if(area.name == "head"):
		queue_free()
		emit_signal("food_eaten")
		


