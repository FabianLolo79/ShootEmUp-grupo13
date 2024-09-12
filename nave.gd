extends CharacterBody2D

# variable para la instancia del disparo
var shooting = true
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
		velocity.y = 0
	move_and_slide()	
	pass
	
func Shoot():
	if Input.is_action_just_pressed("ui_up") and shooting:
		var laser = pre_laser.instantiate()
		get_parent().add_child(laser)
		laser.position.x = position.x
		laser.position.y = position.y -50
		shooting = false
		await get_tree().create_timer(0.5).timeout
		shooting = true
		pass
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("roca"):
		queue_free()	
	pass 
