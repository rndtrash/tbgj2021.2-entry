extends Area

onready var player = get_tree().get_nodes_in_group('Player')[0]
onready var bydlo = $'../Bydlo'
onready var choice_area = $'ChoiceAreaZadacha'
onready var global_state = get_tree().get_nodes_in_group('root')[0]

func _ready():
	choice_area.question_panel.first.text = '[Сарказм]'
	choice_area.question_panel.second.text = 'Съем пирожок...'

func _on_BydloEvent_body_entered(body):
	player.in_cutscene = true
	player.change_anim('idle')
	bydlo.facing = -1
	bydlo.dialog_box.show_text('эй ты')
	yield(get_tree().create_timer(2.0), "timeout")
	player.dialog_box.show_text('хто, я?)')
	yield(get_tree().create_timer(2.0), "timeout")
	if not $"/root/global".ignored_sign:
		bydlo.dialog_box.show_text('хорошо табличку пнул')
		yield(get_tree().create_timer(2.0), "timeout")
		player.dialog_box.show_text('ну спасибо')
		bydlo.translation.z -= 0.5
		player.in_cutscene = false
		queue_free()
	else:
		bydlo.dialog_box.show_text('я тебе въебу')
		yield(get_tree().create_timer(2.0), "timeout")
		player.dialog_box.show_text('а может не надо?')
		yield(get_tree().create_timer(2.0), "timeout")
		bydlo.dialog_box.show_text('решишь задачу - пропущу, а не то получишь в бубен')
		yield(get_tree().create_timer(2.0), "timeout")
		choice_area.tr_q()

func _on_ChoiceAreaZadacha_first():
	player.dialog_box.show_text('Возьму пирожок и вылезу из ямы')
	yield(get_tree().create_timer(2.0), "timeout")
	bydlo.dialog_box.show_text('нихуя ты умный')
	bydlo.translation.z -= 0.5
	player.in_cutscene = false
	queue_free()

func _on_ChoiceAreaZadacha_second():
	player.dialog_box.show_text('Съем пирожок...')
	yield(get_tree().create_timer(2.0), "timeout")
	bydlo.dialog_box.show_text('всё, пизда тебе')
	yield(get_tree().create_timer(2.0), "timeout")
	player.die()
