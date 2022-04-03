extends Node2D

var active = true
var directionblock = "up"
var direction = Vector2(0,-1)
const gap = - 35
var next_tail_dir = Vector2(1,0)
var prev_dir = Vector2(1,0)
onready var head=get_node("head")
onready var tail=preload("res://Scenes/tail.tscn")
onready var rep=preload("res://Scenes/Rep.tscn")
onready var speed = get_parent().speed
onready var screen_size = get_viewport_rect().size
func _ready():
	get_node("head").position = Vector2(600,400)
	add_tail()

func _process(_delta):
	if (active):
		time_delay()
		if(Input.is_action_pressed("ui_up") && directionblock != "down"):
			directionblock = "up"
			direction = Vector2(0,-1)
			head.rotation_degrees=0
			pass
		elif(Input.is_action_pressed("ui_down") && directionblock != "up"):
			directionblock = "down"
			direction = Vector2(0,1)
			head.rotation_degrees=180
			pass
		elif(Input.is_action_pressed("ui_left") && directionblock != "right"):
			directionblock = "left"
			direction = Vector2(-1,0)
			head.rotation_degrees=-90
			pass
		elif(Input.is_action_pressed("ui_right") && directionblock != "left"):
			directionblock = "right"
			direction = Vector2(1,0)
			head.rotation_degrees=90
			pass
	screen_wrap()
	move_snake()
	pass 

func move_snake():
	var dir_change = false
	if(prev_dir != direction):
		prev_dir = direction
		dir_change = true
	var head_pos = get_node("head").position
	get_node("head").position += direction/2 * speed
	
	if(dir_change):
		for i in range(1,get_child_count()):
			get_child(i).add_to_tail(head_pos, direction)

func add_tail():
	Global.score += 5
	var inst = tail.instance()
	var prev_tail = get_child(get_child_count() -1 )
	if(prev_tail.name != "head"):
		inst.cur_dir = prev_tail.cur_dir
		for i in range(0,prev_tail.pos_array.size()):
			inst.pos_array.append(prev_tail.pos_array[i])
			inst.directions.append(prev_tail.directions[i])
		inst.position = prev_tail.position + prev_tail.cur_dir * gap
	else:
		inst.cur_dir = direction  
		inst.position = prev_tail.position + direction * gap
	call_deferred("add_child", inst)
	
func screen_wrap():
	if get_node("head").position.x <= 0:
		get_node("head").position.x = get_viewport_rect().size.x
	if get_node("head").position.x >= get_viewport_rect().size.x +1:
		get_node("head").position.x = 0
	if get_node("head").position.y <= -1:
		get_node("head").position.y = get_viewport_rect().size.y
	if get_node("head").position.y >= get_viewport_rect().size.y +1:
		get_node("head").position.y = 0
	
		
func time_delay():
	active = false
	yield(get_tree().create_timer(0.08), "timeout")
	active=true
