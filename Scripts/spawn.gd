extends Node

@export var boat_scene = "res://Scenes/GameScene.tscn"

var screen_x: int
var screen_y: int

func _ready():
	screen_x = get_viewport().size.x
	screen_y = get_viewport().size.y
	
	var spawn_timer = Timer.new()
	add_child(spawn_timer)
	spawn_timer.wait_time = 5.0
	spawn_timer.one_shot = false
	spawn_timer.connect("timeout", Callable(self, "_spawn_boat"))
	spawn_timer.start()
	
func _spawn_boat():
	var boat = boat_scene.instantiate
	add_child(boat)
	
	var side = randi() % 4
	var spawn_position = Vector2()
	
	match side:
		#верх
		0:
			spawn_position.x = randi_range(0,screen_x)
			spawn_position.y = 0
		
		#низ
		1:
			spawn_position.x = randi_range(0, screen_x)
			spawn_position.y = screen_y
			
		#лево
		2:
			spawn_position.x = 0
			spawn_position.y = randi_range(0, screen_y)
			
		#право
		3:
			spawn_position.x = screen_x
			spawn_position.y = randi_range(0, screen_y)
			
	boat.position = spawn_position
