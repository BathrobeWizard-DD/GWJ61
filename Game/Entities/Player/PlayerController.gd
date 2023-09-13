class_name PlayerController
extends CharacterBody3D

signal state_changed(state: int)
signal animation_changed(animation: String)
signal collides(node: PhysicsBody3D)
signal interact(node: PhysicsBody3D)

var state: int = 0x000000000000000000
var condition: Player.Condition = Player.Condition.ALIVE
var movement: Player.Movement = Player.Movement.IDLE
var action: Player.Action = Player.Action.NONE

var input_handlers: Array[PlayerEffect] = [
	PlayerJump.new(),
	PlayerJumpCancel.new(),
	PlayerSlide.new(),
]

var physics_handlers: Array[PlayerEffect] = [
	PlayerMovement.new(),
	TerainFriction.new(),
	AirborneDrag.new(),
	WorldGravity.new(),
]

var interaction_handlers: Array[PlayerEffect] = [
# TODO
]

var collision_handlers: Array[PlayerEffect] = [
# TODO
]

@onready var rig: Node3D = $Shape
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var interaction_zone: Area3D = $Shape/InteractionZone
@onready var collision_zone: Area3D = $Shape/CollisionZone

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

	# Trigger animation
	var movement_name = Player.Movement.keys()[Player.Movement.values().find(movement)]
	var action_name = Player.Action.keys()[Player.Action.values().find(action)]
	var animation_name = ("%s_%s" % [movement_name, action_name]).to_lower()
	var missing_animation = animation.has_animation(animation_name) == false

	var current_animation = animation_name
	if missing_animation:
		current_animation = "idle_none"

	if animation.current_animation != current_animation:
		if missing_animation:
			print("Missing animation: %s" % animation_name)
		animation.play(current_animation)

	# Apply movement
	self.velocity += effect.velocity


# endregion

# region: Lifecycle


func _ready() -> void:
	interaction_zone.body_entered.connect(func(body): _on_interaction(body))
	collision_zone.body_entered.connect(func(body): _on_collision(body))
	Context.player = self


func _enter_tree() -> void:
	Context.player = self


func _unhandled_input(event: InputEvent) -> void:
	for handler in input_handlers:
		apply_effect(handler, event)


func _physics_process(delta: float) -> void:
	for handler in physics_handlers:
		apply_effect(handler, delta)

	var direction = velocity.normalized()
	rig.rotation_degrees.y = 180.0 if direction.x < 0.0 else 0.0

	move_and_slide()


func _on_collision(body: Node3D) -> void:
	collides.emit(body)
	for handler in collision_handlers:
		apply_effect(handler, body)


func _on_interaction(body: Node3D) -> void:
	interact.emit(body)
	for handler in interaction_handlers:
		apply_effect(handler, body)

# endregion
