# script: bird

extends RigidBody2D

onready var state = FlappingState.new(self)

const STATE_FLYING = 0
const STATE_FLAPPING = 1
const STATE_HIT = 2
const STATE_GROUNDED = 3

func _ready():
	pass
	
func _physics_process(delta):
	state.update(delta)
	pass
	
func _input(event):
	state.input(event)
	pass

func set_state(new_state):
	state.exit()
	
	if new_state == STATE_FLYING:
		state = FlyingState.new(self)
	elif new_state == STATE_FLAPPING:
		state = FlappingState.new(self)
	elif new_state == STATE_HIT:
		state = HitState.new(self)
	elif new_state == STATE_GROUNDED:
		state = GroundedState.new(self)
	pass

func get_state():
	if state is FlyingState:
		return STATE_FLYING
	elif state is FlappingState:
		return STATE_FLAPPING
	elif state is HitState:
		return STATE_FLYING
	elif state is GroundedState:
		return STATE_GROUNDED
	pass
	

# class: FlyingState -----------------

class FlyingState:
	var bird
	
	func _init(bird):
		self.bird = bird
		pass
	
	func update():
		pass
	
	func input(event):
		pass
	
	func exit():
		pass

# class: FlappingState -----------------
	
class FlappingState:
	var bird
	
	func _init(bird):
		self.bird = bird
		bird.linear_velocity = Vector2(50, bird.linear_velocity.y)
		pass
	
	func update(delta):
		if bird.rotation_degrees * -1 > 30:
			bird.angular_velocity = 0
			bird.rotation_degrees = -30
	
		if bird.linear_velocity.y > 0:
			bird.angular_velocity = 1.5
		pass
	
	func flap():
		bird.linear_velocity = Vector2(bird.linear_velocity.x, -150)
		bird.angular_velocity = -3
		bird.get_node("anim").play("flap")
		pass
	
	func input(event):
		if event.is_action_pressed("flap"):
			flap()
		pass
	
	func exit():
		pass

# class: HitState -----------------

class HitState:
	var bird
	
	func _init(bird):
		self.bird = bird
		pass
	
	func update():
		pass
	
	func input(event):
		pass
	
	func exit():
		pass

# class: GroundedState -----------------

class GroundedState:
	var bird
	
	func _init(bird):
		self.bird = bird
		pass
	
	func update():
		pass
	
	func input(event):
		pass
	
	func exit():
		pass