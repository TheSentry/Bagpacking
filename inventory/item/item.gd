extends Control
class_name Item

@export var item_data: ItemData

var item_name: String
var item_shape: Array
var item_size: Vector2i
var item_icon: Texture

@onready var icon_texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	if item_data:
		load_item_data()

func load_item_data() -> void:
	item_name = item_data.name
	item_icon = item_data.icon

	item_shape = item_data.get_shape()
	item_size = Vector2i(item_shape[0].size(), item_shape.size())


	if item_icon and icon_texture_rect:
		icon_texture_rect.texture = item_icon

	print("Item loaded:", item_name)
	print("Item size:", item_size)
	print("Occupied slots:", item_shape)
