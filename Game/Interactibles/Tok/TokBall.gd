class_name TokBall
extends RigidBody3D

const LAUNCH_FORCE_HORIZONTAL = 24.0
const LAUNCH_FORCE_VERTICAL = 16.0

@onready var collision_zone: Area3D = $CollisionZone

# region: Lifecycle


func _ready() -> void:
	collision_zone.body_entered.connect(func(body): _on_collision(body))


# endregion

# region: Events


func _on_collision(body: Node3D) -> void:
	if body is PlayerController:
		print("%s collided while %s" % [body, body.movement])

	if body is PlayerController and body.movement == Player.Movement.SLIDING:
		var direction = 1.0 if body.velocity.normalized().x > 0.0 else -1.0
		apply_impulse(Vector3(LAUNCH_FORCE_HORIZONTAL * direction, LAUNCH_FORCE_VERTICAL, 0.0))
		body.velocity.x += body.velocity.x * -1.25
		body.movement = Player.Movement.RUNNING

# endregion
