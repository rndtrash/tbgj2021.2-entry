extends Spatial

onready var choice_area = $'ChoiceArea2'
onready var player = get_tree().get_nodes_in_group('Player')[0]

func _ready():
	choice_area.question_panel.first.text = 'Обойти'
	choice_area.question_panel.second.text = 'Пойти'

func _on_ChoiceArea2_first():
	player.translation.z -= 0.5
	queue_free()

func _on_ChoiceArea2_second():
	queue_free()
