extends ShipMover

class_name SloopShipMover

@export var area: Area2D
@export var maxDistance: float = 700.0

var targetObject: Node

signal stopped

func _ready():
	area.body_entered.connect(_OnObjectEntered)
	area.area_entered.connect(_OnObjectEntered)

func _OnObjectEntered(object):
	if object is LightHouse:
		targetObject = object

func _Move(delta):
	if !global_position.distance_to(targetObject.global_position) <= maxDistance and targetObject:
		direction = Vector2(targetObject.global_position - self.global_position).normalized()
		super._Move(delta)
	else:
		ship.velocity = Vector2.ZERO
		emit_signal("stopped")
