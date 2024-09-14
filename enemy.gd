extends RigidBody2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Laser") or area.is_in_group("Nave"):
		$AnimationPlayer.play("Explotion") #revisar el or que no anda
		queue_free()	
	pass 
