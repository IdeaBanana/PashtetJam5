extends AbstractAttack

class_name MortarAttack

@export var mortarQuantity: int = 1
@export var shipMover: SloopShipMover
@export var cannonshot_1 = preload("res://music/cannonshot1.wav")
@export var cannonshot_3 = preload("res://music/cannonshot3.wav")
@export var cannonshot_4 = preload("res://music/cannonshot4.wav")
@export_group("Core")
@export var mortarCore := preload("res://Scenes/MortarCore.tscn")

func _ready():
	shipMover.stopped.connect(Attack)

func Attack():
	for i in range(mortarQuantity):
		var betweenTimer := get_tree().create_timer(timeBetweenAttack)
		await betweenTimer.timeout
		var coreInstance: MoratarCore = mortarCore.instantiate()
		var house := get_overlapping_bodies().filter(func(child): return child is LightHouse)
		if get_overlapping_bodies().filter(func(child): return child is LightHouse):
			coreInstance.SetTarget(house[0].global_position)
			coreInstance.global_position = global_position
			get_tree().current_scene.add_child(coreInstance)
			var cannonfxPlayer = AudioStreamPlayer2D.new()
			var randomfxarray = [cannonshot_1, cannonshot_3, cannonshot_4] 
			cannonfxPlayer.stream = randomfxarray.pick_random()
			add_child(cannonfxPlayer)
			cannonfxPlayer.play()
			await cannonfxPlayer.finished
			cannonfxPlayer.queue_free()
	Reload()

func Reload():
	var reloadTimer := get_tree().create_timer(reloadTime)
	await reloadTimer.timeout
	Attack()
