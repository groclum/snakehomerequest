extends Node2D


func _on_arcademode_pressed():
	get_tree().change_scene("res://Scenes/Explainer.tscn")


func _on_storymode_pressed():
	get_tree().change_scene("res://Scenes/Video1.tscn")

