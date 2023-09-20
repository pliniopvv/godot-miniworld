extends CharacterBody2D

@export var SPEED = 24.0

var dir_sprite = "_down"
var anim_sprite = "idle"
var anim_name = anim_sprite + dir_sprite

func _physics_process(delta):
	var change_anim = anim_name
	
	velocity = Vector2.ZERO
	var direction = Input.get_vector("ui_left","ui_right",
	"ui_up","ui_down")
	
	if direction:
		velocity = direction * SPEED
		anim_sprite = "walk"
		dir_sprite = str_dir(direction)
	else:
		anim_sprite = "idle"
	
	anim_name = anim_sprite + dir_sprite
	if change_anim != anim_name:
		$anim.play(anim_name)
	move_and_slide()

func str_dir(d):
	var x = d.x
	var y = d.y
	if x < 0:
		return "_left"
	elif x > 0:
		return "_right"
	if y < 0:
		return "_up"
	elif y > 0:
		return "_down"
	return dir_sprite
