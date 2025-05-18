extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

var new_transform = Transform2D()

var playerVelocity = Vector2(0, 0)
var acceleration = 30
var slowdownAcceleration = 100
var jumpAcceleration = 60
var GRAVITY = 25
var SPEED = 550
var stopJump = true;
var canJump = true;
var midAirMoveScale = 1
signal touching_trash


func _process(delta):
	_animated_sprite.play("default")
	if is_on_floor():
		stopJump = true
		canJump = true
		midAirMoveScale = 1
	if not is_on_floor():
		midAirMoveScale = 0.25
	self.scale.y = 0.7 + (Global.size / 4)
	self.scale.x = 0.7 + (Global.size / 4)
	if Global.change_scene == true:
		new_transform.origin = Vector2(2066.0, -589.0)
		
		self.set_transform(new_transform)
		Global.change_scene = false



func _physics_process(delta):
	if Input.is_action_pressed("Jump") && stopJump && canJump:
		velocity.y = velocity.y - jumpAcceleration
		if velocity.y < -700:
			stopJump = false
	if Input.is_action_just_released("Jump"):
		canJump = false
	elif not is_on_floor():
		velocity.y = velocity.y + GRAVITY
	
	if Input.is_key_pressed(KEY_A):
		velocity.x = max(velocity.x - acceleration * midAirMoveScale, -SPEED)
	elif Input.is_key_pressed(KEY_D):
		velocity.x = min(velocity.x + acceleration * midAirMoveScale, SPEED)
	else:
		if (velocity.x < 0):
			velocity.x = min(velocity.x + acceleration, 0)
		
		if (velocity.x > 0):
			velocity.x = max(velocity.x - acceleration, 0)
	
	move_and_slide()

func _on_first_check_body_entered(body: Node2D) -> void:
	if Global.change_scene == false:
		Global.scene += 1
		Global.cutscene = true
