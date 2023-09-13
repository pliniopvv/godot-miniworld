extends Node2D
class_name TerrainGrama

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_tipe(tipo):
	if ((0 > tipo) or (tipo > 5)):
		return
	$sprite.frame = tipo
