extends Node

var prefix : String = "res://Scenes/"
var path : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	pass

func load_scene(path: String, pos: Vector2):
	if get_child_count() > 0:
		get_child(0).queue_free()
	var scene = load(prefix + path)
	call_deferred("add_child", scene.instantiate()) 
	# add_child(scene.instantiate())
	self.path = path

	if GameData.player:
		GameData.player.position = pos
