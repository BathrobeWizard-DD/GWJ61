extends CharacterBody3D

@onready var state_timer = $move
@onready var sprite = $AnimatedSprite3D
@onready var detection_zone = $Detection/DetectionZone
@onready var enemy = Enemy.new()
var player_detected: bool = false
var player_body
var motion: int = 0
var state: int


func _physics_process(delta):
	move_and_slide()
	if player_detected:
		print((self.global_transform.origin).distance_to(player_body.global_transform.origin))

func change_state():
	if state == 0:
		motion = 0
		sprite.play("Idle")
	elif state == 1:
		motion = -2
		sprite.flip_h = false
		detection_zone.position.x = -2
		sprite.play("Run")
	elif state == 2:
		sprite.flip_h = true
		detection_zone.position.x = 2
		motion = 2
		sprite.play("Run")
	velocity = Vector3(motion, 0, 0)


func _on_move_timeout():
	state_timer.start()
	state = floor(randi_range(0, 3))
	change_state()
	


func _on_detection_body_entered(body):
	if !player_detected:
		player_detected = true
		player_body = body
		state_timer.stop()
		state = 0
		change_state()
		await get_tree().create_timer(0.25).timeout
		state = 4
		change_state()
	
	
