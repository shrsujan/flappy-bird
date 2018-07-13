# script: bird

extends RigidBody2D

func _ready():
	pass
	
func _physics_process(delta):
	if self.rotation_degrees * -1 > 30:
		self.angular_velocity = 0
		self.rotation_degrees = -30
	
	if self.linear_velocity.y > 0:
		self.angular_velocity = 1.5
	pass
	
func flap():
	self.linear_velocity = Vector2(self.linear_velocity.x, -150)
	self.angular_velocity = -3
	pass
	
func _input(event):
	if event.is_action_pressed("flap"):
		flap()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
