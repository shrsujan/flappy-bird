# script: spawner_ground

extends Node2D

const scn_ground = preload("res://scenes/ground.tscn")
const GROUND_WIDTH = 168
const AMOUNT_TO_FILL_VIEW = 2

func _ready():
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawn_ground()
		go_next_pos()
	pass
	
func spawn_ground():
	var new_ground = scn_ground.instance()
	new_ground.position = self.position
	
	var container = get_node("container")
	container.add_child(new_ground)
	pass
	
func go_next_pos():
	self.position = self.position + Vector2(GROUND_WIDTH, 0)
	pass