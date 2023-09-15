extends Node

var game_title: String = ProjectSettings.get_setting("application/config/name")
var wipe:bool = false 

func game_version() -> String:
	if Git.BUILD != null:
		return "%s#%s" % ["DEBUG" if OS.is_debug_build() else "RELEASE", Git.BUILD]
	return "DEV#%s" % [Git.COMMIT]


func player_data(field: String) -> String:
	if Context.player == null:
		return "N/A"
	return "%s" % Context.player[field]
