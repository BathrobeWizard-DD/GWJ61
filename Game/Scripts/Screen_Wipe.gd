extends Node2D


func Screenwipe_Start(target: String):
	$CanvasLayer/AnimationPlayer.play("Wipe")
	await $CanvasLayer/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$CanvasLayer/AnimationPlayer.play_backwards("Wipe")
