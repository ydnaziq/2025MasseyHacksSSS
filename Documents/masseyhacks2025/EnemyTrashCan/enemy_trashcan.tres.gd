extends Area2D


func _on_body_entered(body):
	print("entered")
	Global.size -= 1
