extends Spatial

onready var player = get_tree().get_nodes_in_group('Player')[0]

func _on_MonologueAreaKickedSign3_body_entered(body):
	player.translation.z += 0.5
