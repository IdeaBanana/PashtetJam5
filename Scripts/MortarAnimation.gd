extends AnimatedSprite2D

class_name MortarAnimation

@export var mortar: MortarAttack

func _ready():
	mortar.attacked.connect(_onMortarAttack)
	

func _onMortarAttack():
	play("MortarShoot")
	await animation_finished
	play("MortarStay")

func _process(delta):
	look_at(mortar.shipMover.direction)
