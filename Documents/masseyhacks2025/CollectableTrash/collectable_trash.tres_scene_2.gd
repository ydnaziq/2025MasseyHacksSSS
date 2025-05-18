extends Area2D


signal incrementScore
var medianPosition = position.y
var upOrDown = "up"
var relativePosition = 0
var i = 0.95


func _process(_delta):
	if Global.scene == 0:
		self.visible = false
	else:
		self.visible = true
		if (upOrDown == "up"):
			position.y += 1
			relativePosition += 1
			if relativePosition == 50:
				upOrDown = "down"
		if (upOrDown == "down"):
			position.y -= 1
			relativePosition -= 1
			if relativePosition == -50:
				upOrDown = "up"

func _on_body_entered(_body):
	if Global.scene == 1:
		while scale > Vector2(0.1, 0.1):
			scale *= i 
			i -= 0.1
			await get_tree().create_timer(0.1).timeout
		Global.size2 += 1
		self.queue_free()
