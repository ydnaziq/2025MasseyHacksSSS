extends WorldEnvironment


var i = 0


func _process(_delta):
	if Global.cutscene:
		if Global.scene == 1:
			environment.glow_enabled = false
