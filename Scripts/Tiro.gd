extends Area3D

@export var mesh: Node
@export var player: Node
@export var speed = 2.0

var inY

# Called when the node enters the scene tree for the first time.
func _ready():
	inY = position.y
	mayStart = true


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
	move = false
	mayStart = false
	await(get_tree().create_timer(.15).timeout)
	mayStart = true

@rpc
func reposition(porco):
	if !mayStart:
		return
	
	var y = position.y
	position = porco.position
	position.y = y
	move = true

func _on_body_entered(body):
	if body.is_in_group("Boundaries"):
		reset()
	pass # Replace with function body.
