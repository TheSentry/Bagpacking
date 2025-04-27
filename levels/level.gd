extends Node2D
class_name Level

@onready var availableItems = $AvailableItemsInventory

var level_items = []

func _ready() -> void:
	# Delay initialization of items until layout is completed
	get_tree().process_frame.connect(init_items, CONNECT_ONE_SHOT)

func init_items() -> void:
	for i in range(1, 6):
		level_items.append(Apeloot.items.keys().pick_random())

	for item in level_items:
		add_item_to_available_inventory(item)


func add_item_to_available_inventory(item_name) -> void:
	var item = availableItems.spawn_item(item_name)
	var slot_id = availableItems.find_valid_slot(item)
	var can_place = availableItems.can_place_item(item, slot_id)
	if can_place:
		print("Placing item " + item_name + " at slot index " + str(slot_id))
		availableItems.snap_item_to_grid(item, slot_id)
		availableItems.update_item_state(item)
	else:
		item.queue_free()
