extends Node3D

@rpc
func init(points, pos):
	pos.z = global_position.z
	global_position = pos
	
	var colorDictionary = { -10: $Red, 1: $Brown, 2: $Yellow, 4: $Green }
	#print(points)
	
	for item in colorDictionary:
		if item == points:
			var colorEl: Node = colorDictionary[item]
			var label: Label3D = colorEl.get_child(0)
			var sPoints
			
			if points > 0:
				sPoints = "+"
				$AnimationPlayer.play("show")
			else:
				sPoints = ""
				$AnimationPlayer.play("show_neg")
				
			sPoints += str(points)
			label.text = sPoints
			
			colorDictionary[item].visible = true
		else:
			colorDictionary[item].visible = false
