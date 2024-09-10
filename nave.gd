extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	Move()
	pass
	
func Move():
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else: 
		velocity.x = 0
	move_and_slide()	
	pass
