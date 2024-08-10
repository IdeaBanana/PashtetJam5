extends Node2D

class_name ScoreCounter

@export var lightAttack: LightAttack
@export var label: Label
var scoreValue: int:
	set(value):
		scoreValue = value
		label.text = str(scoreValue)

signal valueChanged

func _ready():
	label.text = str(scoreValue)
	lightAttack.body_entered.connect(_OnLightAttackObjectEntered)

func _OnLightAttackObjectEntered(object):
	for enemy in lightAttack.GetDamageableNodes():
		enemy.GetHpNode().died.connect(_OnEnemyDied.bind(enemy.GetCostNode()))

func _OnEnemyDied(shipCost: ShipCost):
	if shipCost != null:
		var tween := get_tree().create_tween()
		tween.tween_property(self, "scoreValue", scoreValue + shipCost.GetCost(), 0.6)
