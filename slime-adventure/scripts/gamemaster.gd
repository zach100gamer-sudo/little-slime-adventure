extends Node2D
class_name Gamemaster

var emerald : PackedScene = preload("res://Prefabs/emerald.tscn")

func _ready() -> void:
	GameData.gamemaster = self
	SceneManager.load_scene("menu.tscn", Vector2(808, 335))
	
# Called when the node enters the scene tree for the first time.
func play() -> void:
	var player := emerald.instantiate()
	add_child(player)
	
	SceneManager.load_scene("emerald's_house.tscn", Vector2(808, 335))
