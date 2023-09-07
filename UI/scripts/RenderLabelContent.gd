extends Label

var template: String
var pattern: RegEx:
	get:
		if pattern != null:
			return pattern
		var regex = RegEx.new()
		regex.compile("\\{([a-z:_]+)\\}")
		return regex

var data = {
	"game_title": ProjectSettings.get_setting("application/config/name"),
	"git_version": _git_version,
}

@export var update_on_ready = true
@export var update_on_physics_process = false
@export var update_on_process = false

# region: Lifecycle

func _ready() -> void:
	template = self.text
	if update_on_ready:
		render()


func _physics_process(_delta: float) -> void:
	if update_on_physics_process:
		render()


func _process(_delta) -> void:
	if update_on_process:
		render()

# endregion

# region: Internal Helpers

func _keycode_name(keycode: int) -> String:
	return OS.get_keycode_string(keycode)


func _git_version() -> String:
	if Git.Build != null:
		return "%s#%s" % ["DEBUG" if OS.is_debug_build() else "RELEASE", Git.Build]
	return "#%s" % [Git.Commit]

# endregion

# region: Actions

func render() -> void:
	for result in pattern.search_all(template):
		var key = result.get_string(1)
		if data.has(key) == false:
			continue
		var value = data[key].call() if data[key] is Callable else data[key]
		self.text = template.replace("{%s}" % key, value)

# endregion
