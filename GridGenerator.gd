@tool
extends Node2D

@export var grid_size_x: int = 5:
	set(value):
		grid_size_x = value
		#_generate_grid()

@export var grid_size_y: int = 5:
	set(value):
		grid_size_y = value
		#_generate_grid()

@export var cell_spacing: float = 64.0:
	set(value):
		cell_spacing = value
		#_generate_grid()


func _generate_grid():
	print("Generating grid...")
	
	# Remove old nodes
	for child in get_children():
		remove_child(child)
		child.queue_free()

	# Create new empty nodes with ColorRect (dot)
	for x in range(grid_size_x):
		for y in range(grid_size_y):
			var empty = Node2D.new()
			empty.position = Vector2(x * cell_spacing, y * cell_spacing)
			empty.name = "Empty_%d_%d" % [x, y]
			# empty.owner = self.owner

			# Add a ColorRect as a child to visualize this node
			var dot = ColorRect.new()
			dot.color = Color(1, 0, 0)  # Red color
			
			# Set the size correctly:
			dot.custom_minimum_size = Vector2(10, 10)

			empty.add_child(dot)  # Add the ColorRect as a child of the empty node

			add_child(empty)
			dot.owner = get_tree().edited_scene_root
			empty.owner = get_tree().edited_scene_root
