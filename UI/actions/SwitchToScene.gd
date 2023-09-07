extends Button

@export var scene: PackedScene = preload("res://scenes/Main.tscn")


func _pressed() -> void:
	get_tree().change_scene_to_packed(scene)
