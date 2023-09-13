extends TileMap

@export var width = 600
@export var height = 200

var noise = FastNoiseLite.new()
var altitude = {}
var temperatura = {}
var humidade = {}

func _ready():
	altitude = generate_map(0.005)
	temperatura = generate_map(0.05)
	humidade = generate_map(0.05)
	set_tiles()

func _process(delta):
	pass


func generate_map(freq):
	randomize()
	noise.seed = randi()
	noise.frequency = freq
	
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	var gridName = {}
	for x in width:
		for y in height:
			var rand = 2*(abs(noise.get_noise_2d(x,y)))
			gridName[Vector2(x,y)] = rand
	return gridName

func set_tiles():
	for x in width:
		for y in height:
			var pos = Vector2(x,y)
			var alt = altitude[pos]
			var temp = temperatura[pos]
			var hum = humidade[pos]
			
			#Ocean
			if alt < 0.2: set_cell(0, Vector2(x,y), 1, Vector2(4, 0))
			#Beach
			elif between(alt, 0.2, 0.25): set_cell(0, Vector2(x,y), 1, Vector2(3, 0))
			elif between(alt, 0.25, 0.3): set_cell(0, Vector2(x,y), 1, Vector2(2, 0))
			elif between(alt, 0.3, 0.35): set_cell(0, Vector2(x,y), 1, Vector2(1, 0))
			elif between(alt, 0.35, 0.4): set_cell(0, Vector2(x,y), 1, Vector2(0, 0))
			
			#Biomas
			elif alt > 0.4:
				if between(hum, 0.0, 0.5):
					var t = randi_range(0,2)
					set_cell(0, Vector2(x,y), 0, Vector2(t, 0))
				else:
					var t = randi_range(0,2)
					set_cell(0, Vector2(x,y), 0, Vector2(t, 1))

func between(alt, start, stop):
	return start < alt and alt <= stop
