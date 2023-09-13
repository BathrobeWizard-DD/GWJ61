class_name PlayerJumpCancel
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return player.movement == Player.Movement.JUMPING


func handle(player: PlayerController, event: InputEvent) -> PlayerEffect:
	movement = null
	velocity.y = 0.0

	if not (event is InputEventKey) or event.echo:
		return null

	if event.is_action_released("move_jump"):
		velocity.y = -1.0 * player.velocity.y

	return self
