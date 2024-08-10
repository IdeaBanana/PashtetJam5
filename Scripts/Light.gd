extends AbstractAttack

class_name LightAttack

@export var lightWeapon: LightWeapon

var attackTimer: float

func _ready():
	set_process(false)
	body_entered.connect(_OnObjectEntered)
	area_entered.connect(_OnObjectEntered)
	body_exited.connect(_OnObjectExited)
	area_entered.connect(_OnObjectExited)
	lightWeapon.attacked.connect(_OnAttacked)
	lightWeapon.stopAttacked.connect(_OnStopAttacked)

func _OnObjectEntered(object):
	pass

func _OnObjectExited(object):
	pass

func _OnAttacked():
	set_process(true)

func _OnStopAttacked():
	set_process(false)

func _physics_process(delta):
	self.position = lightWeapon.target_position

func _process(delta):
	attackTimer += delta
	if timeBetweenAttack < attackTimer and GetDamageableNodes():
		attackTimer = 0
		Attack()

func Attack():
	if GetDamageableNodes().size() > 0:
		for body in GetDamageableNodes():
			body.GetHpNode().ApplyDamage(damage)

func GetDamageableNodes() -> Array:
	var bodiesArray: Array = get_overlapping_bodies().filter(func(child): return child is EnemyShip)
	var areasArray: Array = get_overlapping_areas().filter(func(child): return child is MoratarCore)
	bodiesArray.append_array(areasArray)
	return bodiesArray
