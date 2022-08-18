extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

var SPEED = 4
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_location()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	velocity = new_velocity
	move_and_slide()
	print(next_location)
	if not is_on_floor():
		velocity.y -= gravity * delta
	
func update_target_location(target_location):
	nav_agent.set_target_location(target_location)
