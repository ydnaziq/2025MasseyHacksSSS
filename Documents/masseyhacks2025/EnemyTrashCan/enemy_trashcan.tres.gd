extends Area2D


func _on_body_entered(_body):
	print("entered")
	if Global.size > -1:
		Global.size -= 1
