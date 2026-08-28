extends RigidBody3D


func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * 1000.0)
		
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3.BACK * delta * 100.0)
		
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3.FORWARD * delta * 100.0)
		
