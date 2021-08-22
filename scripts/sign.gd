extends Spatial

onready var player = $"../../Character"
onready var sign_o = $"../Sign"

func kick_and_say():
	$"/root/global".ignored_sign = false
	player.dialog_box.show_text('н-н-ныа!')
	sign_o.kick()
	queue_free()

func ignore_and_say():
	player.dialog_box.show_text('...')
	$"/root/global".ignored_sign = true
	$'../MonologueAreaKickedSign'.queue_free()
	$'../MonologueAreaKickedSign2'.queue_free()
	queue_free()
