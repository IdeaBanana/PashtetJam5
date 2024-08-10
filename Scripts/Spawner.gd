extends Node2D

class_name ShipSpawner

@export_group("Nodes")
@export var spawnMarkerParent: Node
@export var spawnTimer: Timer

@export_group("Sheeps")
@export var gunBoatSheep: PackedScene =  preload("res://Scenes/GunBoatSheep.tscn")
@export var sloopSheep: PackedScene = preload("res://Scenes/SloopShip.tscn")
@export var frigateSheep: PackedScene = preload("res://Scenes/FrigateShip.tscn")
var shipArray: Array[PackedScene]
var currentSceneShips: Array[EnemyShip]

@export_group("Round")
@export var currentRound: int
@export var maxRound: int

@export_group("Random")
@export var maxSpawn: int = 2
var prevSpawnArray: Array[Marker2D]
@export_subgroup("time")
@export var maxSpawnTime: float = 3.0
@export var minSpawnTime: float = 0.5

func _ready():
	initializeSheepArray()
	spawnTimer.autostart = true
	spawnTimer.start(randf_range(minSpawnTime, maxSpawnTime))
	spawnTimer.timeout.connect(_OnSpawnTimerTimeout)

func _OnSpawnTimerTimeout():
	spawnShip()

func initializeSheepArray(newArray: Array[PackedScene] = []):
	if newArray and shipArray.size() > 0:
		shipArray.append_array(newArray)
	shipArray = [gunBoatSheep, sloopSheep, frigateSheep]

func spawnShip():
	var spawn := GetRandomSpawn()
	var shipInstance := GetRandomShip().instantiate()
	shipInstance.global_position = spawn.global_position
	add_child(shipInstance)

func GetRandomShip() -> PackedScene:
	var randomShip: PackedScene = shipArray.pick_random()
	return randomShip

func GetRandomSpawn() -> Marker2D:
	var randomSpawn: Marker2D = spawnMarkerParent.get_child(spawnMarkerParent.get_children().find(spawnMarkerParent.get_children().filter(func(child): return child is Marker2D).pick_random()))
	return randomSpawn

