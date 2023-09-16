extends MeshInstance3D



func roto():
	$".".rotation = Variables.Vec_selection


func _on_visible_on_screen_enabler_3d_screen_exited():
	$"..".queue_free()
