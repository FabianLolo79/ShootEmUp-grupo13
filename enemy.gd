extends RigidBody2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser") or area.is_in_group("nave"):
		queue_free()	
	pass 
