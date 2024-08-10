extends Node2D

class_name ShipSpawner

#region Export
@export_group("Nodes")
@export var spawnMarkerParent: Node
@export var spawnTimer: Timer

@export_group("Sheeps")
@export var gunBoatShip: PackedScene =  preload("res://Scenes/GunBoatShip.tscn")
@export var sloopShip: PackedScene = preload("res://Scenes/SloopShip.tscn")
@export var frigateShip: PackedScene = preload("res://Scenes/FrigateShip.tscn")
var shipArray: Array[PackedScene]

@export_group("Round")
@export var currentRound: int
@export var maxRound: int

@export_group("Random")
@export var maxSpawn: int = 2
@export_subgroup("time")
@export var maxSpawnTime: float = 3.0
@export var minSpawnTime: float = 0.5
#endregion

var randomShip: EnemyShip
var randomSpawn: Marker2D

func _ready():
	shipArray = [gunBoatShip, sloopShip, frigateShip]
	randomize()
	spawnTimer.autostart = true
	spawnTimer.start(randf_range(minSpawnTime, maxSpawn))
	spawnTimer.timeout.connect(_OnSpawnTimerTimeout)

func _OnSpawnTimerTimeout():
	randomShip = GetRandomShip()
	randomSpawn = GetRandomSpawn()
	SpawnShip()

func SpawnShip(ship: EnemyShip = randomShip, spawn: Marker2D = randomSpawn):
	ship.global_position = spawn.global_position
	get_tree().current_scene.add_child(ship)

func GetRandomShip() -> EnemyShip:
	return shipArray[randi()%shipArray.size()].instantiate()

func GetRandomSpawn() -> Marker2D:
	var filteredArray := spawnMarkerParent.get_children().filter(func(child): return child is Marker2D)
	var randomMarker := spawnMarkerParent.get_child(spawnMarkerParent.get_children().find(filteredArray[randi_range(0, filteredArray.size()-1)]))
	return randomMarker
