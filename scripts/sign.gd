extends Spatial

onready var player = $"../../Character"
onready var sign_o = $"../Sign"

func kick_and_say():
	player.dialog_box.show_text('н-н-ныа!')
	sign_o.kick()
	queue_free()

func ignore_and_say():
	player.dialog_box.show_text('...')
	get_tree().get_nodes_in_group('root')[0].ignored_sign = true
	$'../MonologueAreaKickedSign'.queue_free()
	$'../MonologueAreaKickedSign2'.queue_free()
	queue_free()
