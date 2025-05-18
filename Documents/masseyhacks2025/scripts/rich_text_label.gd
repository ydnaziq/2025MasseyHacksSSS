extends RichTextLabel


var courotine_started = false
var a = ""


func _process(_delta):
	if Global.cutscene:
		if courotine_started == false:
			courotine_started = true
			if Global.scene == 1:
				_type("I love the city! I wish the trash would go away tho")
			else:
				_type("the city is crumbling... under the weight of the trash...")


func _type(string):
	text = ""
	for i in range(len(string)):
		a = string[i]
		text += a
		await get_tree().create_timer(0.1).timeout
	await get_tree().create_timer(1).timeout
	Global.change_scene = true
	Global.cutscene = false
	courotine_started = false
