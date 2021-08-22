extends Control

signal answer(s)

onready var first = $'VBoxContainer/VBoxContainer/1'
onready var second = $'VBoxContainer/VBoxContainer/2'

func _on_1_pressed():
	emit_signal('answer', 'first')

func _on_2_pressed():
	emit_signal('answer', 'second')
