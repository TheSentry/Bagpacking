extends Node

#Signals
signal item_added(to_inv: GridInventory, item: DraggableItem)
signal item_removed(from_inv: GridInventory, item: DraggableItem)
signal item_updated(in_inv: GridInventory, item: DraggableItem)

#Startup
var inventory_refs := {}
@onready var temp_node = Control.new()
func _ready():
	add_child(temp_node)

#Data
enum Rarity {COMMON, UNCOMMON, RARE, EPIC, LEGENDARY}
const ITEM_ICONS_PATH := "res://assets/"
const INVENTORY_ITEM_SIZE := Vector2(56,56)
const item_patterns = {
	"1x1": [[1]],
	"2x2": [
		[1, 1],
		[1, 1]
	],
	"1x2": [
		[0,1],
		[0,1]
	],
	"2x1": [
		[0,0],
		[1,1],
	],
	"3x3": [
		[1, 1, 1],
		[1, 1, 1],
		[1, 1, 1]
	],
	"3x1": [
		[0, 0, 0],
		[1, 1, 1],
		[0, 0, 0],
	],
	"1x3": [
		[0, 1, 0],
		[0, 1, 0],
		[0, 1, 0],
	],
	"T": [
		[1, 1, 1],
		[0, 1, 0],
		[0, 1, 0]
	],
	"L_left": [
		[0, 0, 0],
		[1, 1, 1],
		[0, 0, 1]
	],	"diagonal": [
		[0,1],
		[1,0]
	],
	"diagonal3": [
		[0,0,1],
		[0,1,0],
		[1,0,0],
	],
	"bag_right": [
		[0,1,0],
		[1,1,0],
		[1,1,0],
	],	
}

const rarities := {
	Rarity.COMMON: {"name": "Common", "color": Color.WHITE, "chance": 0.6},
	Rarity.UNCOMMON: {"name": "Uncommon", "color": Color.GREEN_YELLOW, "chance": 0.25},
	Rarity.RARE: {"name": "Rare", "color": Color.DODGER_BLUE, "chance": 0.1},
	Rarity.EPIC: {"name": "Epic", "color": Color.MEDIUM_PURPLE, "chance": 0.04},
	Rarity.LEGENDARY: {"name": "Legendary", "color": Color.ORANGE_RED, "chance": 0.01},
}

const items := {
	"ball": {
		"name": "Ball",
		"desc": "It's round",
		"price": 31,
		"rarity": Rarity.COMMON,
		"pattern": "2x2",
	},
	"chatgpt": {
		"name": "ChatGPT",
		"desc": "Unfortunately, as a Large Language Model, I can't help you",
		"price": 31,
		"rarity": Rarity.COMMON,
		"pattern": "2x2",
	},
	"compass": {
		"name": "Compass",
		"desc": "The North remembers!",
		"price": 31,
		"rarity": Rarity.COMMON,
		"pattern": "2x2",
	},
	"dice": {
		"name": "Dice",
		"desc": "Nice!",
		"price": 31,
		"rarity": Rarity.COMMON,
		"pattern": "1x1",
	},
	"eye": {
		"name": "Eye",
		"desc": "Don't know, if it's real",
		"price": 31,
		"rarity": Rarity.COMMON,
		"pattern": "L_left",
	},
	"flashlight": {
		"name": "Flashlight",
		"desc": "With an 'a', not the other one ...",
		"price": 31,
		"rarity": Rarity.COMMON,
		"pattern": "1x3",
	},
	"merged_trash": {
		"name": "Golden Garbage Bag",
		"desc": "It's garbage, but gold!",
		"price": 31,
		"rarity": Rarity.COMMON,
		"pattern": "bag_right",
	},
}
