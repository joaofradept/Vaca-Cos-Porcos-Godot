extends Control
class_name AUIScreenController_Panel

@export var start_visible: bool

func _init():
	visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if start_visible:
		UIManager.Instance.open_screen(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

@rpc
func show_me():
	visible = true
	
@rpc
func hide_me():
	visible = false
