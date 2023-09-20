extends Camera2D

func _ready():
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("zoom_in"):
		if zoom.x >= 3.0:
			return
		zoom *= 1.1
	if Input.is_action_just_pressed("zoom_out"):
		if zoom.x < 1.0:
			zoom = Vector2(1.0,1.0)
			return
		elif zoom.x == 1.0:
			return
		zoom *= 0.9

func _process(delta):
	pass
