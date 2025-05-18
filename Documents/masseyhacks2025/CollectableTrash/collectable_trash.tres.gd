extends Area2D


var medianPosition = position.y
var upOrDown = "up"
var relativePosition = 0
var i = 0.95


func _process(_delta):
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
	while scale > Vector2(0.1, 0.1):
		scale *= i 
		i -= 0.1
		await get_tree().create_timer(0.1).timeout
	Global.size += 1
	self.queue_free()
