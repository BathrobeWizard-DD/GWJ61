class_name PlayerController
extends CharacterBody3D

signal state_changed(state: int)
signal animation_changed(animation: String)
signal collides(area: Area2D)
signal interact(area: Area2D)

var state: int = 0x000000000000000000
var condition: Player.Condition = Player.Condition.ALIVE
var movement: Player.Movement = Player.Movement.IDLE
var action: Player.Action = Player.Action.NONE

var input_handlers: Array[PlayerEffect] = [
	PlayerJump.new(),
]

var physics_handlers: Array[PlayerEffect] = [
	PlayerMovement.new(),
	TerainFriction.new(),
	AirborneDrag.new(),
	WorldGravity.new(),
]

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# region: State machine


func apply_effect(handler: PlayerEffect, event) -> void:
	if handler.is_enabled(self) == false:
		return

	var effect = handler.handle(self, event)
	if effect == null:
		return

	# Transition state machines
	for state_machine in ["condition", "movement", "action"]:
		if effect[state_machine] != null:
			self[state_machine] = effect[state_machine]

	# Save state
	state = condition | movement | action
	state_changed.emit(state)

	# Apply animation
	if "%s" % effect.animation != "" and effect.animation != animation_player.animation:
		animation_player.play(effect.animation)
		animation_changed.emit(effect.animation)

	# Apply movement
	self.velocity += effect.velocity


# endregion

# region: Lifecycle


func _unhandled_input(event: InputEvent) -> void:
	for handler in input_handlers:
		apply_effect(handler, event)


func _physics_process(delta: float) -> void:
	for handler in physics_handlers:
		apply_effect(handler, delta)
	move_and_slide()

# endregion
