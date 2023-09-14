class_name AirborneDrag
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return (
		player.state & Player.Movement.JUMPING
		or player.state & Player.Movement.FALLING
	)


func handle(player: PlayerController, _delta: float) -> PlayerEffect:
	velocity.x = -1 * player.velocity.x * Player.JUMP_DRAG
	return self
