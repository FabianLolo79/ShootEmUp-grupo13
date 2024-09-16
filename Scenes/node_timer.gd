extends Node


@onready var label = $LabelTimer
@onready var timer = $Timer

func _ready() -> void:
	
	timer.start()
	pass
	
func time():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]

func _process(delta: float) -> void:
	label.text = "%02d:%02d" % time()
	pass

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	pass # Replace with function body.
