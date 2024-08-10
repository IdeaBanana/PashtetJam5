extends Area2D

class_name MoratarCore

@export var damage: int = 10
@export var speedInSec: float = 3.0
@export var fallSpeed: float = 1

@export var target: Vector2

@export var HpNode: AbstractHp
@export var costNode: ShipCost

func GetHpNode() -> AbstractHp:
	return HpNode

func GetCostNode() -> ShipCost:
	return costNode

func _ready():
	var tween := get_tree().create_tween()
	tween.tween_property(self, "global_position", target, speedInSec)
	area_entered.connect(_OnObjectEntered)
	body_entered.connect(_OnObjectEntered)

func _process(delta):
	if !get_tree().current_scene.get_children().filter(func(child): return child is LightHouse):
		FallAnimate()

func FallAnimate():
	var tween := get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2.ZERO, fallSpeed)
	await tween.finished
	queue_free()

func _OnObjectEntered(object):
	if object is LightHouse:
		object.GetHpNode().ApplyDamage(damage)
		queue_free()

func SetTarget(newTarget: Vector2):
	target = newTarget

func GetSpeed() -> float:
	return speedInSec

func SetSpeed(value: float):
	speedInSec = value

func SetDamage(value: int):
	damage = value

func GetDamage() -> int:
	return damage
