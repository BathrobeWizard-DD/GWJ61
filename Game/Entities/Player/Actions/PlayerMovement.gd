class_name PlayerMovement
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return player.state | Player.Condition.ALIVE


func handle(player: PlayerController, _delta: float) -> PlayerEffect:
	movement = null
	velocity = Vector3.ZERO

	var input_dir = Input.get_axis("move_left", "move_right")
	var direction = (player.transform.basis * Vector3(input_dir, 0, 0)).normalized()
	velocity.x = direction.x * Player.SPEED

	# TODO: Handle fine-grained input value to determine if player is running
	if player.movement == Player.Movement.IDLE and abs(input_dir) > 0.1:
		movement = Player.Movement.RUNNING

	if abs(velocity.x) <= 1.0 and player.is_on_floor():
		movement = Player.Movement.IDLE

	return self
