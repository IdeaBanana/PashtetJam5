extends ShipMover

class_name SloopShipMover

@export var area: Area2D
@export var maxDistance: float = 700.0

var targetObject: Node
var isStopped: bool
signal stopped

func _ready():
	area.body_entered.connect(_OnObjectEntered)
	area.area_entered.connect(_OnObjectEntered)

func _OnObjectEntered(object):
	if object is LightHouse:
		targetObject = object

func _process(delta):
	_Move(delta)
	ship.look_at(direction)

func _Move(delta):
	if CheckLightHouse() and !global_position.distance_to(targetObject.global_position) <= maxDistance and targetObject:
		direction = Vector2(targetObject.global_position - self.global_position)
		ship.velocity = direction.normalized() * speed
		ship.move_and_slide()
	else:
		ship.velocity = Vector2.ZERO
		if !isStopped:
			isStopped = true
			emit_signal("stopped")

func CheckLightHouse() -> bool:
	if area.get_overlapping_bodies().filter(func(child): return child is LightHouse):
		return true
	return false
