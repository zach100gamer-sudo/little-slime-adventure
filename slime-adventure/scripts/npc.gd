extends Area2D

@export var color : Color
@export var animation : AnimationPlayer
@export var sprite : Sprite2D
@export var dialog : String

func _ready() -> void:
	sprite.self_modulate = color
	animation.play("old npc idle")


func _on_area_entered(area: Area2D) -> void:
	print(dialog)
