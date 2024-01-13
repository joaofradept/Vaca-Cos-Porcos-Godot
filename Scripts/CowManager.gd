extends Node
class_name CowManager

@export var chefe : Node
@export var louca : Node
@export var acores : Node
@export var engripadas: Array[Node]
@export var startPlace : Node
@export var endPlace : Node

var cows = []
var started

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
	
@rpc
func start_cows():
	started = true
	_process_cows()
	
@rpc
func stop_cows():
	started = false
	
func _process_cows():
	var rng = RandomNumberGenerator.new()
	while started:
		await get_tree().create_timer(.7).timeout
		
		var randomX = rng.randf_range(startPlace.position.x, endPlace.position.x)
		var pos = startPlace.position
		pos.x = randomX
		
		var randomCow = rng.randi_range(0, cows.size())
		
		if randomCow == cows.size():
			randomCow = rng.randi_range(0, engripadas.size() - 1)
			
			var cow = engripadas[randomCow]
			if !cow.visible:
				cow.start_move(pos)
		else:
			var cow = cows[randomCow]
			if !cow.visible:
				cow.start_move(pos)
