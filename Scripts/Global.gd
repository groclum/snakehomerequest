extends Node

var score = 0
var health = 5

func _ready():
	SilentWolf.configure({
	"api_key": "5zeTd9oMt97xgBUIvsPrNacFfalqkpMk4iLM5r4O",
	"game_id": "SNAKEHOMEQUEST",
	"game_version": "0.2.0",
	"log_level": 1
	})
	
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://Scenes/MainMenu.tscn"
	})
	pass
	

