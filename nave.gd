extends CharacterBody2D

# variable para la instancia del disparo
var shoot = true
var pre_laser = preload("res://Scenes/laser.tscn")

#velocidad de movimiento player
const SPEED = 300.0

func _physics_process(delta):
	Move()
	Shoot()
	pass
	
func Move():
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else: 
		velocity.x = 0
	move_and_slide()	
	pass
	
func Shoot():
	if Input.is_action_just_pressed("ui_up") and shoot:
		var laser = pre_laser.instantiate()
		get_parent().add_child(laser)
		laser.position.x = position.x
		laser.position.y = position.y -50
		shoot = false
		await get_tree().create_timer(0.5).timeout
		shoot = true
		pass
		
