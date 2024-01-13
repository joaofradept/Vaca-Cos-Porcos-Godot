extends CharacterBody3D

var moving
@export var speed = 1.0
@export var points = 1
@export var mesh: Node

# Called when the node enters the scene tree for the first time.$Mesh
func _ready():
	_disable()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		move(delta)
		
@rpc
func start_move(pos):
	_enable()
	moving = true
	position = pos

@rpc
func move(delta):
	#while true:
		position.y -= .2 * delta
		#await(get_tree().create_timer(.15).timeout)

func collide_and_get_points():
	_disable()
	position = Vector3(10000, 10000, 10000)
	return points

@rpc
func destroy(delay):
	$CollisionShape3D.set_deferred("disabled", true)
	await get_tree().create_timer(delay)
	visible = false

func _disable():
	visible = false
	$CollisionShape3D.set_deferred("disabled", true)

func _enable():
	visible = true
	$CollisionShape3D.set_deferred("disabled", false)
