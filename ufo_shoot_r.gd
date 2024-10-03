extends CharacterBody2D

@export_range(10,100) var speed := 10.0
var pre_laser_green = preload("res://green_laser.tscn")

func _ready() -> void:
	$AnimationPlayer.play("Idle")
	pass

func _process(delta: float) -> void:
	move_and_collide(Vector2.LEFT * delta * 200)
	pass

func Shoot():
	var laser = pre_laser_green.instantiate()
	get_parent().add_child(laser)
	laser.position.x = position.x 
	laser.position.y = position.y + 80 
	pass
	
func _on_timer_timeout() -> void:
	Shoot()
	pass 

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	await get_tree().create_timer(0.5).timeout
	queue_free()
	pass 

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser") or area.is_in_group("laser_2"):
		Global.score += 400
		
		$AnimationPlayer.play("Explotion")
		$Area2D/CollisionPolygon2D.disabled
		$Explosion.play()
		
		var timer2 = get_tree().create_timer(0.7)
		await timer2.timeout
		queue_free()
		queue_free()
		pass 
