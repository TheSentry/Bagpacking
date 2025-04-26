extends Control

var occupying  #items

@export var tile_size : int = 64

func _ready() -> void:
	size = Vector2i(tile_size,tile_size)
