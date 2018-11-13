# script: game

extends Node

const GROUP_PIPES = "pipes"
const GROUP_GROUNDS = "grounds"
const GROUP_BIRDS = "birds"

const MEDAL_BRONZE = 10
const MEDAL_SILVER = 20
const MEDAL_GOLD = 30
const MEDAL_PLATINUM = 40

const filepath = "user://flappybird_bestscore.data"

var score_best = 0 setget _set_score_best
var score_current = 0 setget _set_score_current

signal score_best_changed
signal score_current_changed

func _ready():
	load_bestscore()
	stage_manager.connect("stage_changed", self, "_on_stage_changed")
	pass

func load_bestscore():
	var file = File.new()
	if not file.file_exists(filepath):
		return
	
	file.open(filepath, File.READ)
	score_best = file.get_var()
	file.close()
	pass

func save_bestscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(score_best)
	file.close()
	pass

func _on_stage_changed():
	score_current = 0
	pass

func _set_score_current(new_value):
	score_current = new_value
	emit_signal("score_current_changed")
	pass

func _set_score_best(new_value):
	if new_value > score_best:
		score_best = new_value
		save_bestscore()
		emit_signal("score_best_changed")
	pass