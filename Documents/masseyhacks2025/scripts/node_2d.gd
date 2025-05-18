extends Node2D

positions = {[], [], []}

func _ready():
	for i in range(3):
		$Lamp.position = _ready()
		var clone = $Lamp.duplicate()
		add_child(clone)
	
