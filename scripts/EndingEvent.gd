extends Area

onready var player = get_tree().get_nodes_in_group('Player')[0]
onready var ending_area = $'../EndingAreaRight'

func _on_EndingEvent_body_entered(body):
	print('Триггер концовки',$"/root/global".ignored_sign,$"/root/global".kicked_alco)
	if $"/root/global".ignored_sign:
		player.in_cutscene = true
		player.dialog_box.show_text('блин, надо было ту табличку пнуть...')
		yield(get_tree().create_timer(3.0), "timeout")
		$"/root/global".ending = 'ПЛОХАЯ'
		ending_area.tr_e()
		return
	if $"/root/global".kicked_alco:
		$"/root/global".ending = 'НОРМ'
		yield(get_tree().create_timer(0.5), "timeout")
		ending_area.tr_e()
		return
	$"/root/global".ending = 'ХОРОШАЯ'
	yield(get_tree().create_timer(0.5), "timeout")
	ending_area.tr_e()
