class_name PlayerJumpCancel
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return player.movement == Player.Movement.JUMPING


func handle(player: PlayerController, event: InputEvent) -> PlayerEffect:
	velocity.y = 0.0
	movement = null

	if not (event is InputEventKey) or event.echo:
		return null

	if event.is_action_released("move_jump"):
		print("%s casted magic to cancel their jump!" % player)
		velocity.y = -1.0 * player.velocity.y

	return self
