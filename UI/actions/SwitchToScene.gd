@tool
extends Button

@export var scene: PackedScene

# region: Events


func _pressed() -> void:
	get_tree().change_scene_to_packed(scene)


# endregion

# region: Editor


func _ready() -> void:
	update_configuration_warnings()


func _get_configuration_warnings() -> PackedStringArray:
	if not scene is PackedScene:
		return ["The target `scene` has not been set correctly!"]
	return []

# endregion
