extends Node2D

class_name ShipMover

@export var ship: EnemyShip
@export var speed: float = 200
@export var direction: Vector2 = Vector2(0,-1)

func _process(delta: float):
	_Move(delta)
	ship.look_at(direction)

func _Move(delta: float):
	ship.velocity = speed * direction
	ship.move_and_slide()
