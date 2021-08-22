extends Spatial

export var follow_path : NodePath
export var bubble_time : float = 5.0

onready var panel = $"Viewport/Panel"
onready var label = $"Viewport/Panel/Label"
onready var follow = get_node(follow_path)
onready var timer = $"Timer"

func _ready():
	hide_text()

func _process(delta):
	if panel.visible:
		translation = lerp(translation, follow.translation + Vector3(0, 1, 0), 3 * delta)

func hide_text():
	panel.visible = false

func show_text(text):
	label.text = text
	if not panel.visible:
		translation = follow.translation + Vector3(0, 1, 0)
		panel.visible = true
	timer.start(bubble_time)

func _on_Timer_timeout():
	hide_text()
