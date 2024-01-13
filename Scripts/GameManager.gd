extends Node

@export var timeManager: TimeManager
@export var cowManager: CowManager
@export var game_time = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	timeManager.init(game_time, 0, -1)
	_start_game()
	
func _start_game():
	await get_tree().create_timer(1).timeout
	timeManager.start_time()
	cowManager.start_cows()
	
func _on_time_updated(currentTime):
	if currentTime == 0:
		_end_game()

func _end_game():
	timeManager.stop_time()
	cowManager.stop_cows()
	Engine.time_scale = 0
