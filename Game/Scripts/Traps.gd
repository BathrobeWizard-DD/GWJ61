extends HitBox
class_name Traps
var Speed
var coords:Vector3


func _ready():
	coords = Variables.Vec_selection
	Speed = Variables.trap_speed
	
func _physics_process(delta):
	var direction = coords
	global_position += Speed * direction * delta 
	
func destroy():
	queue_free()


	

