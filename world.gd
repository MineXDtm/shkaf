extends Node3D

@onready var player = $Player

func _physics_process(delta):
	get_tree().call_group("enemies", "update_target_location", Vector3(player.global_transform.origin.x,0,player.global_transform.origin.z))
