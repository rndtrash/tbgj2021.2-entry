extends ColorRect

func _ready():
	yield(get_tree().create_timer(5.0), "timeout")
	get_tree().change_scene("res://main_scene.tscn")
