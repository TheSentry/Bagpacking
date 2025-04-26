extends Control

@export var columns: int = 10
@export var rows: int = 5

@export var slot_scene: PackedScene
@export var item_scene: PackedScene

@onready var slots: GridContainer = $MarginContainer/Slots
@onready var margin_container: MarginContainer = $MarginContainer
@onready var items: Control = $MarginContainer/Items

var tile_size: int
var separation: int

func _ready() -> void:
	build_grid()
	place_Item(Vector2i(5,5),preload("res://inventory/item/items/test_Item.tres"))
	
func _draw() -> void:
	pass
	
func build_grid() -> void:
	slots.columns = columns
	for i in range(columns*rows):
		var slot_instance = slot_scene.instantiate()
		slots.add_child(slot_instance)
	
	_on_node_resized()
		
func _notification(what):
	if what == NOTIFICATION_RESIZED:
		_on_node_resized()

func _on_node_resized():
	if margin_container != null:
		
		tile_size = int(min(size.x / columns,size.y / rows))
		margin_container.size = Vector2(tile_size*(columns),tile_size*(rows))
		
		separation = int(max(1,tile_size*0.1))
		tile_size = tile_size-separation
		
		slots.add_theme_constant_override("h_separation", separation)
		slots.add_theme_constant_override("v_separation", separation)
		
		for slot in get_tree().get_nodes_in_group("inventory_slot"):
			slot.set_tile_size(tile_size)
		
		for item_instance in get_tree().get_nodes_in_group("items"):
			item_instance.size= Vector2i((tile_size+separation)*item_instance.item_size.x+separation,(tile_size+separation)*item_instance.item_size.y+separation)
			item_instance.position = Vector2((item_instance.pos_on_grid.x-1) * (tile_size + separation),(item_instance.pos_on_grid.y-1) * (tile_size + separation))
func place_Item(pos:Vector2i, item_data: ItemData) -> void:
	var item_instance: Item = item_scene.instantiate()
	item_instance.item_data = item_data
	item_instance.pos_on_grid = pos
	items.add_child(item_instance)
	
