class_name PlayerMovement
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return (
		player.state & Player.Movement.IDLE
		or player.state & Player.Movement.RUNNING
		or player.state & Player.Movement.JUMPING
		or player.state & Player.Movement.FALLING
	)


func handle(player: PlayerController, _delta: float) -> PlayerEffect:
	velocity = Vector3.ZERO
	movement = null

	var input_dir = Input.get_axis("move_left", "move_right")
	var direction = (player.transform.basis * Vector3(input_dir, 0, 0)).normalized()
	velocity.x = direction.x * Player.MOVEMENT_SPEED
	# TODO: Handle fine-grained input value to determine if player is running
	if player.is_on_floor() and abs(input_dir) > 0.1:
		movement = Player.Movement.RUNNING

	return self
