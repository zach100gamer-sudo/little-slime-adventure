extends Node2D

class_name Scene

@export var top : float = -10000
@export var bottom : float = 10000
@export var left : float = -10000
@export var right : float = 10000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameData.camera.limit_top = top
	GameData.camera.limit_bottom  = bottom
	GameData.camera.limit_left = left
	GameData.camera.limit_right = right


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
