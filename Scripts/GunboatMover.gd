extends ShipMover

class_name GunBoatMover

func _ready():
	if ship.global_position.y < get_viewport_rect().get_center().y:
		direction -= direction * 2
	else:
		direction *= abs(direction)

func _process(delta):
	super._process(delta)

func _Move(delta):
	super._Move(delta)
