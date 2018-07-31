# script: hbox_score (built-in)

extends HBoxContainer

const sprite_numbers = [
	preload("res://sprites/number_large_0.png"),
	preload("res://sprites/number_large_1.png"),
	preload("res://sprites/number_large_2.png"),
	preload("res://sprites/number_large_3.png"),
	preload("res://sprites/number_large_4.png"),
	preload("res://sprites/number_large_5.png"),
	preload("res://sprites/number_large_6.png"),
	preload("res://sprites/number_large_7.png"),
	preload("res://sprites/number_large_8.png"),
	preload("res://sprites/number_large_9.png")
]

func _ready():
	game.connect("score_current_changed", self, "_on_score_current_changed")
	set_number(game.score_current)
	pass

func _on_score_current_changed():
	set_number(game.score_current)
	pass

func set_number(number):
	for child in get_children():
		child.queue_free()
	
	for digit in utils.get_digits(number):
		var texture_rect = TextureRect.new()
		texture_rect.set_texture(sprite_numbers[digit])
		add_child(texture_rect)
	pass