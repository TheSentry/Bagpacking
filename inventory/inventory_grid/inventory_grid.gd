extends Control

@export var columns: int = 10
@export var rows: int = 5

@export var slot_scence: PackedScene

@onready var slots: GridContainer = $MarginContainer/Slots
@onready var margin_container: MarginContainer = $MarginContainer

func _ready() -> void:
	build_grid()
	
func _draw() -> void:
	pass
	
func build_grid() -> void:
	var tile_size = min(margin_container.size.x / columns,margin_container.size.y / rows)
	margin_container.size = Vector2(tile_size*columns,tile_size*rows)
	slots.columns = columns
	for i in range(columns*rows):
		var slot_instance = slot_scence.instantiate()
		slot_instance.set_tile_size(tile_size)
		slots.add_child(slot_instance)
		
func _notification(what):
	if what == NOTIFICATION_RESIZED:
		_on_node_resized()

func _on_node_resized():
	if margin_container != null:
		var tile_size = min(size.x / columns,size.y / rows)
		margin_container.size = Vector2(tile_size*columns,tile_size*rows)
		print(margin_container.size,size)
		for slot in get_tree().get_nodes_in_group("inventory_slot"):
			slot.set_tile_size(tile_size)
