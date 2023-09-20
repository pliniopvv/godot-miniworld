extends Node

var size = Vector3(500,500,100)
var map = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for x in size.x:
		for y in size.y:
			for z in size.z:
				var val = randi_range(0,100)
				map[Vector3(x,y,z)] = val
	print("Finish: ", map.size())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

