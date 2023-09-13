extends Container


func _ready() -> void:
	if not OS.is_debug_build():
		get_parent().hide()
