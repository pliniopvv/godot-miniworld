extends Node2D

@export_category("Configurações do terreno")
@export_range(1, 500) var size_world = 100
@export_category("Configurações dos tiles")
@export var size_tile = 16

@export var grama : PackedScene

var floor_map = {}

func _ready():
	randomize()

	for x in size_world:
		for y in size_world:
			var key = get_key(x,y)
			var tile = grama.instantiate()
			tile.position.x = x * size_tile
			tile.position.y = y * size_tile
			
			var tipe = randi_range(0, 5)
			tile.set_tipe(tipe)
			
			floor_map[key] = tile
			get_node(".").add_child(tile)

func get_key(x,y):
	return str(x) + "," + str(y)

func _process(delta):
	pass
