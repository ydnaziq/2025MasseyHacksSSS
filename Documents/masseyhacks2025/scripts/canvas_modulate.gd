extends CanvasModulate


var i = 0


func _process(_delta):
	if Global.scene == 0:
		pass
	else:
		if Global.change_scene == true:
			color = Color(0.2, 0.6, 0.2)
