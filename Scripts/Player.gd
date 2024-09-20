extends CharacterBody3D
class_name Player

@export var tiro : Node
@export var speed = 1.0

var _myPoints = 0
var _hitCount = 0
var _move_x: int = 1
var _move_y: int = 2
var _pressedKeys = []
signal points_updated(points)


func _physics_process(delta):
	var dir = 0
	
	if _pressedKeys.size() > 0:
		dir = _pressedKeys[-1]
	
	move_and_collide(Vector3(dir, 0, 0) * speed * delta)

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("move_left"):
			if -1 not in _pressedKeys:
				_pressedKeys.append(-1)
		if event.is_action_pressed("move_right"):
			if 1 not in _pressedKeys:
				_pressedKeys.append(1)
				
		if event.is_action_pressed("shoot"):
			tiro.shoot(self)
			
		if event.is_action_released("move_left"):
			if -1 in _pressedKeys:
				_pressedKeys.erase(-1)
		if event.is_action_released("move_right"):
			if 1 in _pressedKeys:
				_pressedKeys.erase(1)

@rpc
func add_points(points):
	_hitCount += 1
	_myPoints += points
	_myPoints = max(0, _myPoints)
	emit_signal("points_updated", _myPoints)
