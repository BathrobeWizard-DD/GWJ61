extends Node3D
@onready var spawner = $"."


@export_category("Traps")
@export var fireballtrap:bool
@export var spiketrap:bool
@export var lavatrap:bool 
@export var Stalagmitetrap:bool 
@export_subgroup("Trap Properties")
@export var traptimer:int
@export var trap_speed:int 
@export var loop:bool
@export_enum(
	"Left",
	"Right",
	"Up",
	"Down"
) var Trap_direction:int 
@export_subgroup("Spike Trap  Properties")
@export var time_in:int
@export var time_out:int


@export_category("Traps Nodes")
@export var Fireball:PackedScene = preload("res://Game/Assets/Objects/fireball.tscn")
@export var Spikes:PackedScene = preload("res://Game/Assets/Objects/Trap_Spike.tscn")
@export var Stalagmite:PackedScene = preload("res://Game/Assets/Objects/stlagmate_trap.tscn")




func _ready():
	$Placement.visible = false
	$Placement/Rotation.visible = false
	if Trap_direction == 0:
		Variables.Vec_selection = Variables.Left
	elif Trap_direction == 1:
		Variables.Vec_selection = Variables.Right
	elif Trap_direction == 2:
		Variables.Vec_selection = Variables.UP
	elif Trap_direction == 3:
		Variables.Vec_selection =Variables.Down
		
	Variables.timein = time_in
	Variables.timeout = time_out
	Variables.trap_speed = trap_speed
	Spawn_traps()

func Spawn_traps():
	if fireballtrap == true:
		Fire_trap()
	elif spiketrap == true:
		Spike_trap()
	elif Stalagmitetrap == true:
		Stalagmite_trap()
	
func Fire_trap():
	var firetrap = Fireball.instantiate()
	if loop == true:
		if fireballtrap == true:
			get_tree().current_scene.add_child(firetrap)
			firetrap.position = spawner.position
			firetrap.rotation = spawner.rotation
			await get_tree().create_timer(traptimer).timeout
			Fire_trap()
			return
func Spike_trap():
	var spiketrap2 = Spikes.instantiate()
	var position_set:bool = false 
	if spiketrap == true:
		get_tree().current_scene.add_child.call_deferred(spiketrap2)
		if position_set == false:
			spiketrap2.position =spawner.position
			position_set = true 
		return
		
func Stalagmite_trap():
	var marker
	var stag = Stalagmite.instantiate()
	if Stalagmitetrap == true:
		get_tree().current_scene.add_child.call_deferred(stag)
		stag.position = spawner.position
		await get_tree().create_timer(traptimer).timeout
		Stalagmite_trap()
