extends Camera

onready var character = $"../Character"

export var distance : float = 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	translation = character.translation + Vector3(3.0 * character.facing, 1.0, 3.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translation = lerp(translation, character.translation + Vector3(3.0 * character.facing, 1.0, distance), 2.5 * delta)
