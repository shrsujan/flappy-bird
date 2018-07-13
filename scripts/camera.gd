# script: camera

extends Camera2D

onready var bird = get_tree().root.get_child(0).get_node("bird")

func _ready():
	pass
	
func _physics_process(delta):
	self.position = Vector2(bird.position.x, 0)
	pass