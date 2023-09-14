extends Camera3D

@export var offset: Vector2 = Vector2(0, 2)
@export var target: Node3D


func _process(_delta: float) -> void:
	position.x = target.position.x + offset.x
	position.y = target.position.y + offset.y
	look_at(target.position, Vector3.UP)
