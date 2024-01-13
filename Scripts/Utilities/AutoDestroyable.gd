extends Node
class_name AutoDestroyable

@export var _delay = -1

func init(delay):
	_delay = delay

# Called when the node enters the scene tree for the first time.
func _ready():
	await _delay > -1
	await get_tree().create_timer(_delay).timeout
	get_parent().queue_free()
