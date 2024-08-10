extends AbstractHp

class_name EnemyHp

func ApplyDie():
	var shipSink = AudioStreamPlayer2D.new()
	shipSink.stream = preload("res://music/watersplash.wav")
	add_child(shipSink)
	shipSink.play()
	emit_signal("died")
	parent.queue_free()
