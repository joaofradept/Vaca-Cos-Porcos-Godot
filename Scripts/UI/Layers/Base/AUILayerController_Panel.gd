extends Control
class_name AUILayerController_Panel

var screenControllers = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	_get_child_controllers()

# Get all child controllers
func _get_child_controllers():
	for child in get_children():
		if child is AUIScreenController_Panel:
			screenControllers[child.name] = child

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

@rpc
func show_screen(screen: AUIScreenController_Panel):
	screenControllers[screen.name].show_me()

@rpc
func hide_screen(screen: AUIScreenController_Panel):
	screenControllers[screen.name].hide_me()
