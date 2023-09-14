extends Node3D
@export_file("*.tscn") var Portal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	print("Entered")


func _on_area_3d_area_entered(area):
	get_tree().change_scene_to_file(Portal)
