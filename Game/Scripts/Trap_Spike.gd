
extends Node3D
var timein:int 
var timeout:int


@onready var Inout = $Timer
func _ready():
	Spikes_go()
	timein = Variables.timein
	timeout = Variables.timeout


func process():
	pass
	
func Spikes_go():
	Inout.wait_time = timein
	$AnimationPlayer.play("Spike")
	
	await get_tree().create_timer(timein).timeout
	$AnimationPlayer.play_backwards("Spike")
	
	await get_tree().create_timer(timeout).timeout
	Spikes_go()
	
	
	
	


func _on_timer_timeout():
	pass
	
