extends AbstractAttack

class_name LightAttack

@export var lightWeapon: LightWeapon

var attackBody: EnemyShip
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
	if object is EnemyShip:
		SetBodyForAttack(object)

func _OnObjectExited(object):
	if object == attackBody:
		attackBody = null

func _OnAttacked():
	set_process(true)

func _OnStopAttacked():
	set_process(false)

func _physics_process(delta):
	self.position = lightWeapon.target_position

func _process(delta):
	attackTimer += delta
	if timeBetweenAttack < attackTimer and attackBody:
		attackTimer = 0
		Attack()

func Attack(body: EnemyShip = attackBody):
	if body:
		body.GetHpNode().ApplyDamage(damage)

func SetBodyForAttack(value: EnemyShip):
	attackBody = value
