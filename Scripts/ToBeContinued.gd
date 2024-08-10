extends Control

func _ready():
	var tween := get_tree().create_tween()
	tween.tween_property(self, "global_position",get_viewport_rect().position, 0.4)
	await tween.finished
	var secondTween := get_tree().create_tween()
	secondTween.tween_property(self,"global_position", Vector2(global_position.x - 100, global_position.y), 0.07)
	await secondTween.finished
	var thridTween := get_tree().create_tween()
	thridTween.tween_property(self, "global_position", get_viewport_rect().position, 0.1)
