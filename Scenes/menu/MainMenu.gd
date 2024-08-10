extends Node2D

@onready var audioplay = $CanvasLayer/Start/AudioStreamPlayer
@onready var audioclick = $CanvasLayer/Quit/AudioStreamPlayer
@onready var music = $AudioStreamPlayer2D
@onready var secret = $CanvasLayer/Secretanim

func _ready():
	while 1 < 2:
		music.play()
		await music.finished
		music.stop()
		music.play()

func _on_start_pressed():
	audioplay.play()
	await audioplay.finished
	get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")

func _on_quit_pressed():
	audioclick.play()
	await audioclick.finished
	get_tree().quit()

func _on_secret_pressed():
	secret.play("secret")
