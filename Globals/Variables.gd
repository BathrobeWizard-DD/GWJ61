extends Node

var game_title: String = ProjectSettings.get_setting("application/config/name")


func game_version() -> String:
	if Git.BUILD != null:
		return "%s#%s" % ["DEBUG" if OS.is_debug_build() else "RELEASE", Git.BUILD]
	return "DEV#%s" % [Git.COMMIT]
