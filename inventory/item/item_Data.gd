extends Resource
class_name ItemData

const item_patterns = {
	"1x1": [[1]],
	"2x2": [
		[1, 1],
		[1, 1]
	],
	"1x2": [
		[0, 1],
		[0, 1]
	],
	"2x1": [
		[0, 0],
		[1, 1]
	],
	"3x3": [
		[1, 1, 1],
		[1, 1, 1],
		[1, 1, 1]
	],
	"3x1": [
		[0, 0, 0],
		[1, 1, 1],
		[0, 0, 0]
	],
	"T": [
		[1, 1, 1],
		[0, 1, 0],
		[0, 1, 0]
	],
	"diagonal": [
		[0, 1],
		[1, 0]
	],
	"diagonal3": [
		[0, 0, 1],
		[0, 1, 0],
		[1, 0, 0]
	]
}

@export var name: String
@export_enum("1x1", "2x2", "1x2", "2x1", "3x3", "3x1", "T", "diagonal", "diagonal3") var shape: String = "1x1"
@export var icon: Texture

func get_shape() -> Array:
	return item_patterns.get(shape)
