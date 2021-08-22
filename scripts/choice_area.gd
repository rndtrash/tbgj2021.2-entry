extends Area

signal good
signal bad
signal first
signal second

export var question_panel_scene : String = 'res://prefabs/question_panel_yn.tscn'
export var text : String = ''
export var one_shot : bool = true
export var unlock_after_answer : bool = true

onready var question_panel = load(question_panel_scene).instance()
onready var player = get_tree().get_nodes_in_group('Player')[0]

var triggered_question = false

func _ready():
	question_panel.visible = false
	question_panel.connect('answer', self, 'answer')
	question_panel.get_node('./VBoxContainer/Label').text = text
	add_child(question_panel)

func _on_ChoiceArea_body_entered(body):
	if triggered_question or body.name != 'Character':
		return
	tr_q()

func tr_q():
	triggered_question = true
	question_panel.visible = true
	player.in_cutscene = true
	player.change_anim('idle')

func answer(s):
	emit_signal(s)
	if unlock_after_answer:
		player.in_cutscene = false
	if one_shot:
		queue_free()
	else:
		triggered_question = false
