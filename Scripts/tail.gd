extends Area2D

var directions = []
var pos_array = []
var cur_dir = Vector2()
var speed = 0

func _ready():
	speed = get_parent().speed 

func _process(_delta):
	if (directions.size() > 0):
		if(position == pos_array[0]):
			cur_dir = directions[0]
			remove_from_tail()
	position += cur_dir/2 * speed
	screen_wrap()
	
func remove_from_tail():
	directions.pop_front()
	pos_array.pop_front()
	
func add_to_tail(head_pos, dir):
	pos_array.append(head_pos)
	directions.append(dir)
	pass

func screen_wrap():
	if position.x <= 0:
		position.x = get_viewport_rect().size.x
	if position.x >= get_viewport_rect().size.x +1:
		position.x = 0
	if position.y <= -1:
		position.y = get_viewport_rect().size.y
	if position.y >= get_viewport_rect().size.y +1:
		position.y = 0

func _on_tail_area_entered(area):
	if(area.name == "head"):
		get_tree().change_scene("res://Scenes/GameOverScene.tscn")
