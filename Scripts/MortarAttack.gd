extends AbstractAttack

class_name MortarAttack

@export var mortarQuantity: int = 1
@export var shipMover: SloopShipMover

@export_group("Core")
@export var mortarCore := preload("res://Scenes/MortarCore.tscn")

func _ready():
	shipMover.stopped.connect(Attack)

func Attack():
	for i in range(mortarQuantity):
		pass

