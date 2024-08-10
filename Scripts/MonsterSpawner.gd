extends Node2D

class_name MonsterSpawner

@export var tentacleMonster := preload("res://Scenes/TentacleMonster.tscn")
var monsterArray: Array

@export_group("Spawn preferens")
@export var _minTime: float = 20.0
@export var _maxTime: float = 40.0
var spawnTimer : SceneTreeTimer

func _ready():
	CreateMatrix()
	monsterArray = [tentacleMonster]

func RandomPosition():
	pass

func RandomMonster() -> Monster:
	var randomMonster: Monster = monsterArray.pick_random().instantiate()
	return randomMonster

func CreateMatrix():
	var PartViewport: Rect2 = Rect2(Vector2(get_viewport_rect().size.x/2, get_viewport_rect().position.y), get_viewport_rect().size)
	print(PartViewport)


func spawnMonster():
	pass
