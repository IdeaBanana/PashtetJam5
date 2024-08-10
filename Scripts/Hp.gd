extends CollisionShape2D

class_name AbstractHp

@export var healthPoint: int = 100.0
@export var parent: Node
signal damaged
signal died

func ApplyDamage(damage: int):
	healthPoint -= damage
	if CheckDie(damage):
		ApplyDie()
	else:
		emit_signal("damaged")

func CheckDie(damage: int) -> bool:
	if healthPoint - damage <= 0:
		return true
	return false

func ApplyDie():
	emit_signal("died")
	parent.queue_free()
