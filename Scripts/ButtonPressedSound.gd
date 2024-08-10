extends AudioStreamPlayer

class_name MenuAudio

@export var button: BaseButton

func _ready():
	button.pressed.connect(_OnButtonPressed)

func _OnButtonPressed():
	play()
