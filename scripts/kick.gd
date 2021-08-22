extends Spatial

onready var player = $AnimationPlayer

var current_animation = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func kick():
	change_anim('flyawaynow')

func change_anim(animation):
	if current_animation != animation:
		print("changed animation to ", animation)
		player.play(animation)
		current_animation = animation

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
