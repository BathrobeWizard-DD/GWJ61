extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# var input_dir = Input.get_vector("move_left", "move_right", "ui_up", "ui_down")
	var input_dir = Input.get_axis("move_left", "move_right")
	var direction = (transform.basis * Vector3(input_dir, 0, 0)).normalized()
	velocity.x = direction.x * SPEED if direction else move_toward(velocity.x, 0, SPEED)

	move_and_slide()
