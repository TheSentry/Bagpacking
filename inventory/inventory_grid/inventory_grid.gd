extends Control

@export var columns: int = 10
@export var rows: int = 5

@export var slot_scence: PackedScene

@onready var slots :GridContainer = $Slots

func _ready() -> void:
	build_grid()
	
func _draw() -> void:
	pass
	
func build_grid() -> void:
	slots.columns = columns
	for i in range(columns*rows):
		var slot_instance = slot_scence.instantiate()
		slots.add_child(slot_instance)
