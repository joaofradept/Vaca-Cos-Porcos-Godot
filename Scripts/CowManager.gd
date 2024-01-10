extends Node

@export var chefe : Node
@export var louca : Node
@export var acores : Node
@export var engripada : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	chefe.start_move()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
