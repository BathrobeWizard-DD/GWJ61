class_name TerainFriction
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return player.is_on_floor()


func handle(player: PlayerController, _delta: float) -> PlayerEffect:
	velocity.x = -1 * player.velocity.x * Player.FRICTION
	return self