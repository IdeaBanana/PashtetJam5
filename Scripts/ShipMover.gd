extends Node2D

class_name ShipMover

@export var ship: EnemyShip
@export var speed: float = 200
@export var direction: Vector2 = Vector2(0,-1)

func _process(delta: float):
	_Move(delta)
	if get_tree().current_scene.get_child(0):
		ship.look_at(get_tree().current_scene.get_child(0).global_position)

func _Move(delta: float):
	ship.velocity = speed * direction
	ship.move_and_slide()
