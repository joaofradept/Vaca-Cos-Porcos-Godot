extends CharacterBody3D

@export var tiro : Node
@export var speed = 1.0

var move_x: int = 1
var move_y: int = 2
var pressedKeys = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var dir = 0
	
	if pressedKeys.size() > 0:
		dir = pressedKeys[-1]
	
	move_and_collide(Vector3(dir, 0, 0) * speed * delta)

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("move_left"):
			if -1 not in pressedKeys:
				pressedKeys.append(-1)
		if event.is_action_pressed("move_right"):
			if 1 not in pressedKeys:
				pressedKeys.append(1)
				
		if event.is_action("shoot"):
			tiro.reposition(self)
			
		if event.is_action_released("move_left"):
			if -1 in pressedKeys:
				pressedKeys.erase(-1)
		if event.is_action_released("move_right"):
			if 1 in pressedKeys:
				pressedKeys.erase(1)
