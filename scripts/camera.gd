# script: camera

extends Camera2D

onready var bird = get_node("../bird")

func _ready():
	pass
	
func _physics_process(delta):
	self.position = Vector2(bird.position.x, bird.position.y - 50)
	pass