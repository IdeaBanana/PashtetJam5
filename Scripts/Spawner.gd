extends Node2D

class_name ShipSpawner

@export_group("Nodes")
@export var spawnMarkerParent: Node
@export var spawnTimer: Timer

@export_group("Sheeps")
@export var gunBoatShip: PackedScene =  preload("res://Scenes/GunBoatSheep.tscn")
@export var sloopShip: PackedScene = preload("res://Scenes/SloopShip.tscn")
@export var frigateShip: PackedScene = preload("res://Scenes/FrigateShip.tscn")
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
	pass

func GetRandomShip():
	pass

func GetRandomSpawn():
	pass
