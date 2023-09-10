class_name WorldGravity
extends PlayerEffect

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func is_enabled(player: PlayerController) -> bool:
	return not player.is_on_floor()


func handle(_player: PlayerController, delta: float) -> PlayerEffect:
	velocity.y = -1 * gravity * delta * 2.5
	return self
