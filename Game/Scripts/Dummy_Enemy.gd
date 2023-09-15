extends CharacterBody3D

@onready var state_timer = $move 
@onready var sprite = $AnimatedSprite3D
var motion:int= 0 
var state:int 


	
func _physics_process(delta):
	move_and_slide()

func _on_move_timeout():
	state_timer.start()
	state = floor(randi_range(0,3))
	if state == 0:
		motion = 0
		sprite.play("Idle")
	elif state == 1:
		motion = -2
		sprite.flip_h = false
		sprite.play("Run")
		
	elif state ==2:
		sprite.flip_h = true
		motion = 2
		sprite.play("Run")
		
	
	velocity = Vector3(motion,0,0)


