extends Area

onready var player = get_tree().get_nodes_in_group('Player')[0]
onready var alco = $'../Alcoholic'
onready var choice_area = $'ChoiceAreaKickAlco'
onready var global_state = get_tree().get_nodes_in_group('root')[0]

func _ready():
	pass

func _on_BydloEvent_body_entered(body):
	player.in_cutscene = true
	player.change_anim('idle')
	player.facing = 1
	player.dialog_box.show_text('эй')
	yield(get_tree().create_timer(2.0), "timeout")
	alco.facing = -1
	alco.dialog_box.show_text('*ик*')
	yield(get_tree().create_timer(2.0), "timeout")
	choice_area.tr_q()

func _on_ChoiceAreaKickAlco_bad():
	$"/root/global".kicked_alco = false
	yield(get_tree().create_timer(2.0), "timeout")
	player.dialog_box.show_text('отличная работа!')
	yield(get_tree().create_timer(2.0), "timeout")
	player.dialog_box.show_text('продолжай в том же духе!')
	yield(get_tree().create_timer(2.0), "timeout")
	alco.dialog_box.show_text('млмлемлмеъе *ик*')
	alco.translation.z -= 0.5
	player.in_cutscene = false
	queue_free()

func _on_ChoiceAreaKickAlco_good():
	$"/root/global".kicked_alco = true
	player.dialog_box.show_text('получай')
	yield(get_tree().create_timer(2.0), "timeout")
	alco.fall()
	yield(get_tree().create_timer(5.0), "timeout")
	alco.dialog_box.show_text('*хрр*')
	yield(get_tree().create_timer(1.0), "timeout")
	player.dialog_box.show_text('мда')
	player.in_cutscene = false
	queue_free()
