extends TextureButton

func _pressed():
	await $MenuAudio.finished
	get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")
