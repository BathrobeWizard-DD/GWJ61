class_name PlayerAttack
extends PlayerEffect



func is_enabled(player: PlayerController) -> bool:
	return player.is_on_floor() and player.velocity.y <= 0.5


func handle(_player: PlayerController, event: InputEvent) -> PlayerEffect:
	movement = null
	velocity.y = 0.0

	if not (event is InputEventKey) or event.echo:
		return null

	if event.is_action_pressed("attack"):
		print("attack")
	

	return self
