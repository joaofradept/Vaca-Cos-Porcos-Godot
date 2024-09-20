extends Area3D

@export var mesh: Node
@export var player: Node
@export var speed = 2.0

var _inY
var _hitCount = 0
var _lastHitPos
signal add_points(points, player)

# Called when the node enters the scene tree for the first time.
func _ready():
	_inY = position.y
	mayStart = true
	_count_points(0)
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
	_hitCount = 0

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
	var points = body.collide_and_get_points()
	_lastHitPos = body.global_position
	_inst_points_instance(points, _lastHitPos)
	_count_points(points)
	
func _count_points(val):
	emit_signal("add_points", val, player)
	_hitCount += 1
	if _hitCount > 1:
		emit_signal("add_points", 2, player)
		_inst_combo_instance(_hitCount, _lastHitPos)
		#emit_signal("new_combo", _hitCount, player)
		
	
func _inst_points_instance(points, position):
	var inst = preload("res://Scenes/points_instance.tscn").instantiate()
	get_parent().add_child(inst)
	inst.init(points, global_position)
	
func _inst_combo_instance(hitCount, position):
	var inst = preload("res://Scenes/combo_instance.tscn").instantiate()
	get_parent().add_child(inst)
	inst.init(hitCount, global_position)
	
func _disable():
	visible = false
	$CollisionShape3D.set_deferred("disabled", true)

func _enable():
	visible = true
	$CollisionShape3D.set_deferred("disabled", false)
