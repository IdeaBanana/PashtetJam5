extends CharacterBody2D

class_name EnemyShip

@export var hpNode: AbstractHp
@export var shipCost: ShipCost
func GetHpNode() -> AbstractHp:
	return hpNode

func GetCostNode() -> ShipCost:
	return shipCost
