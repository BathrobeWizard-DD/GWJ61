class_name PlayerSlide
extends PlayerEffect


func is_enabled(player: PlayerController) -> bool:
	return player.is_on_floor()


func handle(player: PlayerController, event: InputEvent) -> PlayerEffect:
	movement = null
	velocity.x = 0.0

	if not (event is InputEventKey) or not event.pressed or event.echo:
		return null

	var direction = player.velocity.normalized()
	if event.is_action_pressed("move_slide"):
		velocity.x = (Player.SPEED + Player.SLIDE_ENERGY) * direction.x
		movement = Player.Movement.SLIDING

	return self
