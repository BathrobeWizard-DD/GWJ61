@tool
extends SubViewport

@onready var container: Container = $Container


func _process(_delta: float) -> void:
	size = container.size
