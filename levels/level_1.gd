extends Level

func init_items() -> void:
	for i in range(0, 2):
		self.level_items.append(Apeloot.items.keys().pick_random())

	for item in self.level_items:
		add_item_to_available_inventory(item)
