class_name CountDownTimer
extends Control
@export_category("Timer")
@export var Minutes:int
@export var Seconds:int


@onready var animplay = $AnimationPlayer
var minutes = 0
var seconds = 0
var click:bool = false 

func _ready():
	timer_reset()
	death_time()
	
func _process(delta):
	click = Variables.timeloss
func _on_timer_timeout():
	if seconds == 0:
		if minutes >0:
			minutes-= 1
			seconds = 60 
	
	seconds -= 1 
	$timer.text=String(str(minutes))+":"+String(str(seconds))
	
	
	
func timer_reset():
	minutes = Minutes
	seconds = Seconds
	
func death_time():
	
	if click == true:
	
		$"Death timer".text = String(str(-10))
		print("You died")
		animplay.play("timer loss")
		seconds = seconds - 10
		Variables.timeloss = false 
