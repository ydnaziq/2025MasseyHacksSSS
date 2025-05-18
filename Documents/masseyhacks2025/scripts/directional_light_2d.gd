extends DirectionalLight2D

func _process(_delta):
	if Global.cutscene:
		self.visible = true
	else:
		self.visible = false
