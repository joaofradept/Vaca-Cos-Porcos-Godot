extends Control
class_name UIManager

static var Instance: UIManager

@export var panelLayer: AUILayerController_Panel

func _init():
	if !Instance:
		Instance = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
@rpc
func open_screen(screen):
	await ready
	if screen is AUIScreenController_Panel:
		panelLayer.show_screen(screen)

@rpc
func close_screen(screen):
	if screen is AUIScreenController_Panel:
		panelLayer.hide_screen(screen)
