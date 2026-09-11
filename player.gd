extends RigidBody3D

## How much vertical force to apply when moving.
@export_range(750.0, 3000.0) var thrust: float = 1000.0

## How much rotational force to apply when moving.
@export_range(50.0, 200.0) var torque_thrust: float = 100.0


func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * thrust)
		
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3.BACK * delta * torque_thrust)
		
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3.FORWARD * delta * torque_thrust)


func crash_sequence() -> void:
	get_tree().reload_current_scene()


func complete_level(next_level_file: String) -> void:
	get_tree().change_scene_to_file(next_level_file)


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Hazard"):
		crash_sequence()
		
	if body.is_in_group("Goal"):
		complete_level(body.file_path)
