extends Node2D

onready var food = preload("res://Scenes/food.tscn")
var speed = 10
onready var tail= preload("res://Scenes/tail.tscn")


func _ready():
	add_food()
	pass

func add_food():
	var inst = food.instance()
	inst.position = Vector2(get_random_number(900,50), get_random_number(500,50)) ##The position should be random
	inst.connect("food_eaten", self, "spawn_next_food_and_tail") 
	call_deferred("add_child", inst)


func spawn_next_food_and_tail():
	add_food()
	get_node("snake").add_tail()


func get_random_number(MAX, MIN):
	randomize()
	var num = randi()%MAX+MIN
	return num

#func snake_die():   
	#var inst = tail.instance()
	#inst.connect("die", self, "crko") 


#func crko():
	#snake_die()
	#queue_free()

