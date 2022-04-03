extends VideoPlayer

func _ready():
	pass


func _on_VideoPlayer_finished():
	get_tree().change_scene("res://Scenes/WoodlandsHome.tscn")


func _on_TouchScreenButton_pressed():
	get_tree().change_scene("res://Scenes/WoodlandsHome.tscn")
