extends Area3D

@export var mesh: Node
@export var player: Node
@export var speed = 2.0

var _inY
var _myPoints = 0
signal points_updated(points)

# Called when the node enters the scene tree for the first time.
func _ready():
	_inY = position.y
	mayStart = true
	_set_myPoints(0)
	_disable()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move:
		_move(delta)
	elif player != null:
		var pos = player.position
		pos.y = _inY
		position = pos
	

func _move(delta):
	position.y += speed * delta
	
var move: bool
var mayStart: bool

@rpc
# chamar quando o tiro chegar ao topo do ecra
func reset():
	_disable()
	move = false
	mayStart = false
	#await(get_tree().create_timer(.15).timeout)
	mayStart = true

@rpc
func shoot(player):
	if !mayStart:
		return
	
	var y = position.y
	position = player.position
	position.y = y
	_enable()
	move = true

func _on_body_entered(body):
	if body.is_in_group("Boundaries"):
		reset()
	elif body.is_in_group("Cow"):
		_on_cow_entered(body)
		
func _on_cow_entered(body):
	_set_myPoints(body.collide_and_get_points())
	
func _set_myPoints(val):
	_myPoints += val
	_myPoints = max(0, _myPoints)
	emit_signal("points_updated", _myPoints)
	
func _disable():
	visible = false
	$CollisionShape3D.set_deferred("disabled", true)

func _enable():
	visible = true
	$CollisionShape3D.set_deferred("disabled", false)
