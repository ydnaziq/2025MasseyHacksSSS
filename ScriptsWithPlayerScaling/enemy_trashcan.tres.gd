extends Area2D


signal enemyHit


func _on_body_entered(body):
	enemyHit.emit()
