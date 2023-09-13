class_name TerainFriction
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return player.is_on_floor()


func handle(player: PlayerController, _delta: float) -> PlayerEffect:
	velocity.x = -1 * player.velocity.x * Player.MOVEMENT_FRICTION
	movement = null

	if player.movement == Player.Movement.SLIDING:
		velocity.x = -1 * player.velocity.x * Player.SLIDE_FRICTION

	if abs(velocity.x) <= 1.0 and player.is_on_floor():
		movement = Player.Movement.IDLE

	return self
