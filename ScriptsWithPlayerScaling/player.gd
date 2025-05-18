extends CharacterBody2D

var playerVelocity = Vector2(0, 0)
var acceleration = 20
var slowdownAcceleration = 100
var jumpAcceleration = 50
var GRAVITY = 25
var SPEED = 550
var stopJump = true;
var canJump = true;
var midAirMoveScale = 1
var size = 1
signal touching_trash


func _process(delta):
	if is_on_floor():
		stopJump = true
		canJump = true
		midAirMoveScale = 1
	if not is_on_floor():
		midAirMoveScale = 0.25
	
	self.scale.y = 1 + (size / 4)


func _physics_process(delta):
	if Input.is_action_pressed("Jump") && stopJump && canJump:
		velocity.y = velocity.y - jumpAcceleration
		if velocity.y < -500:
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


func _on_enemy_trashcan_enemy_hit():
	if not size == 1:
		size -= 1


func _on_collectable_trash_increment_score():
	size += 1
