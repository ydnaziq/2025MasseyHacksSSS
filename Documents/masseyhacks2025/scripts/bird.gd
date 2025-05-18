extends Sprite2D

func _process(_delta):
	if Global.scene == 0:
		self.visible = true
	else:
		self.visible = false
