extends Area3D
@export_file("*.tscn") var portal


func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area: Area3D):
	print("Entered")
	get_tree().change_scene_to_file(portal)
