extends CharacterBody2D

class_name LightHouse

@export var HpNode: AbstractHp
@export var AttackNode: AbstractAttack
func _ready():
	HpNode.damaged.connect(onAttack) 
func onAttack():
	$AudioStreamPlayer2D.play()
func GetHpNode() -> AbstractHp:
	return HpNode

func GetAttackNode() -> AbstractAttack:
	return AttackNode
