extends Area2D

class_name AbstractAttack

@export_group("AttackProperties")
@export var damage: int
@export var reloadTime: float = 5.0
@export var timeBetweenAttack: float = 0.47

func Attack():
	pass

func Reload():
	pass
