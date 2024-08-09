extends CharacterBody2D

class_name LightHouse

@export var HpNode: AbstractHp
@export var AttackNode: AbstractAttack

func GetHpNode() -> AbstractHp:
	return HpNode

func GetAttackNode() -> AbstractAttack:
	return AttackNode
