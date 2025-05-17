extends Area2D


signal incrementScore
var medianPosition = position.y
var upOrDown = "up"
var relativePosition = 0


func _process(delta):
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


func _on_body_entered(body):
	self.queue_free()
	incrementScore.emit()
