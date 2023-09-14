class_name TerainFriction
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return (
		player.state & Player.Movement.IDLE
		or player.state & Player.Movement.RUNNING
		or player.state & Player.Movement.SLIDING
	)


func handle(player: PlayerController, _delta: float) -> PlayerEffect:
	velocity.x = -1 * player.velocity.x * Player.MOVEMENT_FRICTION
	movement = null

	if player.movement == Player.Movement.SLIDING:
		velocity.x = -1 * player.velocity.x * Player.SLIDE_FRICTION

	if abs(player.velocity.x) < 1.0:
		velocity.x = -1 * player.velocity.x
		movement = Player.Movement.IDLE

	return self
