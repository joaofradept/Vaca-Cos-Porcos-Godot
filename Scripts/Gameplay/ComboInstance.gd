extends Node3D

@rpc
func init(shotCount, pos):
	pos.z = global_position.z
	global_position = pos
	
	var comboDictionary = { 2: $X2, 3: $X3 }
	print("combo", shotCount)
	
	for item in comboDictionary:
		if item == shotCount:
			var el: Node = comboDictionary[item]
			var label: Label3D = el.get_child(0)
			var sPoints
			
			$AnimationPlayer.play("show")
			
			comboDictionary[item].visible = true
		else:
			comboDictionary[item].visible = false
