extends Area2D

class_name MoratarCore

static var damage: int = 10
static var speed: float = 50

func GetSpeed() -> float:
	return speed

func SetSpeed(value: float):
	speed = value

func SetDamage(value: int):
	damage = value

func GetDamage() -> int:
	return damage
