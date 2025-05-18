extends Area2D


func _on_body_entered(_body):
	if Global.size > -1:
		Global.size -= 1
