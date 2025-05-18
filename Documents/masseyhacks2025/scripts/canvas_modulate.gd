extends CanvasModulate


var i = 0


func _process(_delta):
	if Global.scene == 0:
		pass
	elif Global.scene == 1:
		if Global.change_scene == true:
			color = Color(0.2, 0.6, 0.2)
	elif Global.scene == 2:
		if Global.change_scene == true:
			color = Color(0.1, 0.8, 0.1)
