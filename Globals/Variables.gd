extends Node

var game_title: String = ProjectSettings.get_setting("application/config/name")
var wipe:bool = false 
var timein:int
var timeout:int 
var Left:Vector3 = Vector3.LEFT
var Right:Vector3 = Vector3.RIGHT
var UP:Vector3 = Vector3.UP
var Down:Vector3 = Vector3.DOWN
var Vec_selection:Vector3
var trap_speed:int
var timeloss:bool 


func game_version() -> String:
	if Git.BUILD != null:
		return "%s#%s" % ["DEBUG" if OS.is_debug_build() else "RELEASE", Git.BUILD]
	return "DEV#%s" % [Git.COMMIT]


func player_data(field: String) -> String:
	if Context.player == null:
		return "N/A"
	return "%s" % Context.player[field]
