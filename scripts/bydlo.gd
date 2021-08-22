extends KinematicBody

onready var player = $AnimationPlayer
onready var dialog_box = get_node(dialog_box_path)

export var dialog_box_path : NodePath

var current_animation = ''
var facing = 1 # 1 - right, -1 - left
var in_cutscene = false

# Called when the node enters the scene tree for the first time.
func _ready():
	change_anim('idle')

func change_anim(animation):
	if current_animation != animation:
		print("changed animation to ", animation)
		player.play(animation)
		current_animation = animation

func _process(delta):
	rotation_degrees.y = lerp(rotation_degrees.y, 0 if facing == 1 else 180, 10 * delta)

func _on_AnimationPlayer_animation_finished(anim_name):
	print("finished ", anim_name)
