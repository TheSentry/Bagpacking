extends Control

var occupying: Item

func set_tile_size(tile_size:int) -> void:
	size = Vector2i(tile_size,tile_size)
