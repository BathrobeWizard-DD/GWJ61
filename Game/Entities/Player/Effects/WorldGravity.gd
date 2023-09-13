class_name WorldGravity
extends PlayerEffect

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func is_enabled(player: PlayerController) -> bool:
	return not player.is_on_floor()


func handle(player: PlayerController, delta: float) -> PlayerEffect:
	movement = player.movement
	velocity.y = -1 * gravity * delta * 2.5

	if player.velocity.y < 0.0:
		movement = Player.Movement.FALLING

	return self
