extends Area

export var text : String = ''

func _on_ChoiceArea_body_entered(body):
	if body.name != 'Character':
		return
	print('Концовка')
	$"/root/global".ending = text
	tr_e()

func tr_e():
	get_tree().change_scene("res://ending.tscn")
