extends Marker2D

var pre_roca = preload("res://Scenes/roca.tscn")
var cae = true

func _physics_process(delta: float) -> void:
	if cae:
		var roca = pre_roca.instantiate()
		get_parent().add_child(roca)
		roca.global_position = global_position
		cae = false
		await get_tree().create_timer(2).timeout
		cae = true
		pass
	pass
