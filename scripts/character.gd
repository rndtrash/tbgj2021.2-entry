extends KinematicBody

onready var player = $AnimationPlayer

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

#func _input(event):
#	pass

func _process(delta):
	if not in_cutscene:
		if Input.is_action_pressed("character_left"):
			facing = -1
			move_and_collide(Vector3.RIGHT * facing * delta)
			change_anim('walk')
		elif Input.is_action_pressed("character_right"):
			facing = 1
			move_and_collide(Vector3.RIGHT * facing * delta)
			change_anim('walk')
		else:
			change_anim('idle')
	#######################
	rotation_degrees.y = lerp(rotation_degrees.y, 0 if facing == 1 else 180, 10 * delta)
	print(facing, " ", rotation_degrees.y)

func _on_AnimationPlayer_animation_finished(anim_name):
	print("finished ", anim_name)
