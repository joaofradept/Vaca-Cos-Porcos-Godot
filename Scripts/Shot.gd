extends Area3D

@export var mesh: Node
@export var player: Node
@export var speed = 2.0

var inY
var myPoints

# Called when the node enters the scene tree for the first time.
func _ready():
	inY = position.y
	mayStart = true
	myPoints = 0
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move:
		_move(delta)
	elif player != null:
		var pos = player.position
		pos.y = inY
		position = pos
	
	
func _move(delta):
	position.y += speed * delta
	
var move: bool
var mayStart: bool

@rpc
# chamar quando o tiro chegar ao topo do ecra
func reset():
	visible = false
	move = false
	mayStart = false
	#await(get_tree().create_timer(.15).timeout)
	mayStart = true

@rpc
func shoot(porco):
	if !mayStart:
		return
	
	var y = position.y
	position = porco.position
	position.y = y
	visible = true
	move = true

func _on_body_entered(body):
	if body.is_in_group("Boundaries"):
		reset()
	elif body.is_in_group("Cow"):
		_on_cow_entered(body)
		
func _on_cow_entered(body):
	myPoints += body.collide_and_get_points()
	myPoints = max(0, myPoints)
	
	print("points: " + str(myPoints))
