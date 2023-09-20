extends Node2D
class_name TerrainGrama

func _ready():
	pass

func _process(delta):
	pass

func set_tipe(tipo):
	if ((0 > tipo) or (tipo > 5)):
		return
	$sprite.frame = tipo
