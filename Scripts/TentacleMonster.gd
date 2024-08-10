extends Monster

class_name TentacleMonster
@export var lightHouse: LightHouse

@export_group("damage")
@export var _minDamage: int = 1
@export var _maxDamage: int = 10

func _ready():
	lightHouse.GetAttackNode().attacked.connect(CheckTouch)

func CheckTouch():
	if self in lightHouse.get_overlapping_areas():
		_OnTouched()

func _OnTouched():
	lightHouse.GetHpNode().ApplyDamage(randi_range(_minDamage, _maxDamage))
