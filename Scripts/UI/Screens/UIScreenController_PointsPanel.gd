extends AUIScreenController_Panel
class_name UIScreenController_PointsPanel

@export var pointsLabel: Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_points_updated(points):
	pointsLabel.text = str(points)
