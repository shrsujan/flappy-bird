# script: spawner_pipe

extends Node2D

const scn_pipe = preload("res://scenes/pipe.tscn")
const GROUND_HEIGHT = 56
const PIPE_WIDTH = 26
const OFFSET_X = 65
const OFFSET_Y = 55
const AMOUNT_TO_FILL_VIEW = 3

func _ready():
	var bird = utils.get_main_node().get_node("bird")
	if bird:
		bird.connect("state_changed", self, "_on_bird_state_changed", [], CONNECT_ONESHOT)
	pass

func _on_bird_state_changed(bird):
	if bird.get_state() == bird.STATE_FLAPPING:
		start()

func start():
	go_int_pos()
	
	for i in AMOUNT_TO_FILL_VIEW:
		spawn_and_move()
	pass
	
func go_int_pos():
	randomize()
	
	var init_pos = Vector2()
	init_pos.x = get_viewport_rect().size.x + PIPE_WIDTH/2
	init_pos.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - GROUND_HEIGHT - OFFSET_Y)
	
	var camera = utils.get_main_node().get_node("camera")
	if camera:
		init_pos.x += camera.get_total_pos().x
	
	self.position = init_pos
	pass

func spawn_and_move():
	spawn_pipe()
	go_next_pos()
	pass

func spawn_pipe():
	var new_pipe = scn_pipe.instance()
	new_pipe.position = self.position
	new_pipe.connect("tree_exited", self, "spawn_and_move")
	
	var container = get_node("container")
	container.call_deferred("add_child", new_pipe)
	pass

func go_next_pos():
	randomize()
	
	var next_pos = self.position
	next_pos.x += PIPE_WIDTH/2 + OFFSET_X + PIPE_WIDTH/2
	next_pos.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - GROUND_HEIGHT - OFFSET_Y)
	self.position = next_pos
	pass