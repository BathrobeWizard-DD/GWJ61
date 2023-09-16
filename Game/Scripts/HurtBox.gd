class_name HurtBox
extends Area3D

var Projectile:HurtBox
@export var Hurting:Node3D

func _on_area_entered(Hitbox:HitBox)->void:
	
	if Hitbox == null:
		return
	if owner.has_method("take_damage"):
		owner.take_damage(Hitbox.Damage)
		Hurting.Health = Hurting.Health - Hitbox.Damage
		
		
