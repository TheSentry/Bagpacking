extends Node2D

@onready var animated_plane = $AnimatedSprite2D

func _ready() -> void:
	animated_plane.play("default")
	await animated_plane.animation_finished
	get_tree().change_scene_to_file("res://cutscenes/granny_start_scene.tscn")
