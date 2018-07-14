# script: pipe

extends StaticBody2D

onready var right = get_node("right")
onready var camera = utils.get_main_node().get_node("camera")

func _ready():
	add_to_group(game.GROUP_PIPES)
	pass

func _process(delta):
	if camera == null: return
	
	if right.global_position.x <= camera.get_total_pos().x:
		queue_free()
	pass
