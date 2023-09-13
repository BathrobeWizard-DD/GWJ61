class_name AirborneDrag
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return not player.is_on_floor()


func handle(player: PlayerController, _delta: float) -> PlayerEffect:
	velocity.x = -1 * player.velocity.x * Player.JUMP_DRAG
	return self
