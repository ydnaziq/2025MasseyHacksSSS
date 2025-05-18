extends Camera2D


func _process(_delta):
	if Global.cutscene:
		zoom = Vector2(0.2 , 0.2)
		offset.x = 100
	else:
		zoom = Vector2(0.6, 0.6)
		offset.x = 0
