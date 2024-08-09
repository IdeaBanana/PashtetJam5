extends RayCast2D

class_name LightWeapon

@export var light: Line2D
@export var _maxLineWidth: float = 50
@export var laserOffset: float = 75.0

@export_group("Animation")
@export var _appearTime: float = 0.6
@export var _disAppearTime: float = 0.4

var tween: Tween

var isAttack: bool

signal stopAttacked
signal attacked

func _ready():
	stopAttacked.connect(_OnStopAttack)

## Следит за нажатием на клавишу
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			AppearLigth()
		elif !event.pressed:
			DisappearLigth()

## Появление луча
# После окончания анимации isAttack = true
func AppearLigth():
	tween = get_tree().create_tween()
	tween.tween_property(light, "width", _maxLineWidth, _appearTime)
	SetAttackMode(true)

## Исчезновение луча
# Сразу isAttack = false
func DisappearLigth():
	SetAttackMode(false)
	tween = get_tree().create_tween()
	tween.tween_property(light, "width", 0, _disAppearTime)

func _process(delta):
	get_tree().create_tween().tween_property(self, "target_position", get_local_mouse_position(), 1)
	light.points[1] = Vector2(target_position.x + laserOffset, target_position.y)

func _OnStopAttack():
	tween.stop()

#region Get Set
func GetAttackMode() -> bool:
	return isAttack

func SetAttackMode(value: bool):
	isAttack = value
	if isAttack:
		emit_signal("attacked")
	else:
		emit_signal("stopAttacked")
#endregion
