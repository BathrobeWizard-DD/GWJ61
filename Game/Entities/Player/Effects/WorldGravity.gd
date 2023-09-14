class_name WorldGravity
extends PlayerEffect

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func is_enabled(player: PlayerController) -> bool:
	return (
		player.state & Player.Movement.JUMPING
		or player.state & Player.Movement.FALLING
		or not player.is_on_floor()
	)


func handle(player: PlayerController, delta: float) -> PlayerEffect:
	velocity.y = -1 * gravity * delta * 2.5
	movement = null

	if player.velocity.y < 0.0:
		movement = Player.Movement.FALLING

	#if player.is_on_floor():
	#	movement = Player.Movement.IDLE

	return self
