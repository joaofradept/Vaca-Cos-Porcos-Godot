extends Node
class_name TimeManager

var _started
var _currentTime: int
var _increment: int
signal time_updated(currentTime)
	
@rpc
func init(initial_time, goal_time, increment):
	_increment = increment
	_currentTime = initial_time
	emit_signal("time_updated", _currentTime)

@rpc
func start_time():
	_started = true
	_process_time()

@rpc
func stop_time():
	_started = false

func _process_time():
	while _started:
		await get_tree().create_timer(1).timeout
		_currentTime += _increment
		emit_signal("time_updated", _currentTime)
	
