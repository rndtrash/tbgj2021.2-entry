extends KinematicBody

onready var player = $AnimationPlayer
onready var dialog_box = get_node(dialog_box_path)
onready var footsteps = $AudioStreamPlayer3D

export var dialog_box_path : NodePath

var current_animation = ''
var facing = 1 # 1 - right, -1 - left
var in_cutscene = false
var moving = false
var playing_footsteps = false

# Called when the node enters the scene tree for the first time.
func _ready():
	change_anim('idle')

func set_footsteps():
	if moving != playing_footsteps:
		if moving:
			footsteps.play()
		else:
			footsteps.stop()
		playing_footsteps = moving

func change_anim(animation):
	if current_animation != animation:
		print("changed animation to ", animation)
		player.play(animation)
		current_animation = animation

func _process(delta):
	if not in_cutscene:
		if Input.is_action_pressed("character_left"):
			moving = true
			facing = -1
			move_and_collide(Vector3.RIGHT * facing * delta * 5 if OS.is_debug_build() else 1)
			change_anim('walk')
		elif Input.is_action_pressed("character_right"):
			moving = true
			facing = 1
			move_and_collide(Vector3.RIGHT * facing * delta * 5 if OS.is_debug_build() else 1)
			change_anim('walk')
		else:
			moving = false
			change_anim('idle')
	else:
		moving = false
	
	set_footsteps()
	#######################
	rotation_degrees.y = lerp(rotation_degrees.y, 0 if facing == 1 else 180, 10 * delta)

func _on_AnimationPlayer_animation_finished(anim_name):
	print("finished ", anim_name)

func die():
	get_tree().change_scene("res://gameover.tscn")
