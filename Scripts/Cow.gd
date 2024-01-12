extends CharacterBody3D

var moving
@export var speed = 1.0
@export var points = 1
@export var mesh: Node

# Called when the node enters the scene tree for the first time.$Mesh
func _ready():
	visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		move(delta)
		
@rpc
func start_move(pos):
	visible = true
	moving = true
	position = pos

@rpc
func move(delta):
	#while true:
		position.y -= .2 * delta
		#await(get_tree().create_timer(.15).timeout)

func collide_and_get_points():
	visible = false
	position = Vector3(10000, 10000, 10000)
	return points
