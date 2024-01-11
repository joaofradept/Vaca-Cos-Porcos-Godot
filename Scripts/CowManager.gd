extends Node

@export var chefe : Node
@export var louca : Node
@export var acores : Node
@export var engripada : Node
@export var startPlace : Node
@export var endPlace : Node

var cows = []

# Called when the node enters the scene tree for the first time.
func _ready():
	cows.append(chefe)
	cows.append(chefe)
	cows.append(chefe)
	cows.append(chefe)
	cows.append(louca)
	cows.append(louca)
	cows.append(louca)
	cows.append(acores)
	cows.append(acores)
	cows.append(engripada)
	await get_tree().create_timer(1.0).timeout
	_process_cows()
	pass #chefe.start_move()
	
func _process_cows():
	var rng = RandomNumberGenerator.new()
	while true:
		await get_tree().create_timer(.7).timeout
		var randomX = rng.randf_range(startPlace.position.x, endPlace.position.x)
		var randomCow = rng.randi_range(0, cows.size() - 1)
		var pos = startPlace.position
		pos.x = randomX
		var cow = cows[randomCow]
		if !cow.visible:
			cow.start_move(pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
