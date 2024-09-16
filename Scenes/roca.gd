extends RigidBody2D

#var score :=0

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Laser") or area.is_in_group("Nave"):
		#$AnimationPlayer.play("Explotion") #revisar el error que no anda
		# sonido de explosión
		queue_free()	
	pass 


"""
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser") or area.is_in_group("nave"):
		
		$Area2D/CollisionShape2D.disabled = true
		$Explosion.play()
		visible = false
		
		var timer2 = get_tree().create_timer(0.5)
		await timer2.timeout
		
		queue_free()
"""
