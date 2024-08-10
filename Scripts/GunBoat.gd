extends EnemyShip

class_name GunBoatSheep

func _process(delta):
	_CheckDeath()

func _CheckDeath():
	if !get_viewport_rect().has_point(global_position):
		queue_free()
