extends AUIScreenController_Panel
class_name UIScreenController_TimePanel

@export var timeLabel: Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_time_updated(currentTime):
	timeLabel.text = str(currentTime)
