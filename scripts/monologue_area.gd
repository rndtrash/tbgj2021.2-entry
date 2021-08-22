extends Area

export var text : String = ''
export var one_shot : bool = true

onready var player = get_tree().get_nodes_in_group('Player')[0]

func _on_MonologueArea_body_entered(body):
	if body.name != 'Character':
		return
	player.dialog_box.show_text(text)
	if one_shot:
		queue_free()
