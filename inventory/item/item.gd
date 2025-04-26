extends Control
class_name Item

@export var item_data: ItemData

var item_name: String
var item_shape: Array
var item_size: Vector2i
var item_icon: Texture

var pos_on_grid: Vector2i

var following_mouse :bool = false

@onready var icon_texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	if item_data:
		load_item_data()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("I was clicked: ", self.name)
			following_mouse = !following_mouse



func _process(delta: float) -> void:
	if following_mouse:
		#position = get_global_mouse_position()
		snap_to_grid()

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

func snap_to_grid():
	var inventory = get_tree().get_first_node_in_group("inventory")
	if inventory == null:
		return
		
	var relative_pos = get_global_mouse_position() - inventory.margin_container.global_position
	
	var tile_size = inventory.tile_size
	var separation = inventory.separation
	
	var col = int(relative_pos.x / (tile_size + separation)) + 1
	var row = int(relative_pos.y / (tile_size + separation)) + 1
	
	pos_on_grid = Vector2i(col, row)
	
	position = Vector2(
		(col - 1) * (tile_size + separation),
		(row - 1) * (tile_size + separation)
	)
