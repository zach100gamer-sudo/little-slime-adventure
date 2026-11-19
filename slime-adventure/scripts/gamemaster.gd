extends Node2D

var emerald : PackedScene = preload("res://Prefabs/emerald.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player := emerald.instantiate()
	add_child(player)
	
	SceneManager.load_scene("emerald's_house.tscn", Vector2(808, 335))
