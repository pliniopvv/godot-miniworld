extends Node2D

@export_category("Configurações do terreno")
@export var size_world = Vector2(100,50)
@export_category("Configurações dos tiles")
@export var size_tile = 16

@export var grama : PackedScene
@export var player : CharacterBody2D

var floor_map = {}

func _ready():
	plot_terrain(Vector2(0,0))
	pass

func plot_terrain(pos: Vector2):
	randomize()
	var center_loader = size_world/2
	for x in size_world.x:
		for y in size_world.y:
			var key = Vector2(floor(x+pos.x/size_tile)-center_loader.x,floor(y+pos.y/size_tile)-center_loader.y)
			if not floor_map.has(key):
				var tile = grama.instantiate()
				tile.position.x = key.x * size_tile
				tile.position.y = key.y * size_tile
				
				var tipe = randi_range(0, 5)
				tile.set_tipe(tipe)
				
				floor_map[key] = tile
				get_node(".").add_child(tile)

func get_key(x,y):
	return str(x) + "," + str(y)

var atual_pos: Vector2
func _process(delta):
	if player != null:
		if player.position != atual_pos:
			atual_pos = player.position
			plot_terrain(player.position)
	pass
