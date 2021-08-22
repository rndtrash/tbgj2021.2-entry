extends Control

signal answer(s)

func _on_QuestionPanelYN_gui_input(event):
	if Input.is_action_pressed('choice_good'):
		emit_signal('answer', 'good')
		queue_free()
	elif Input.is_action_pressed('choice_bad'):
		emit_signal('answer', 'bad')
		queue_free()
