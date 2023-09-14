extends Label

@export var update_on_ready = true
@export var update_on_physics_process = false
@export var update_on_process = false

var template: String
var pattern: RegEx:
	get:
		if pattern != null:
			return pattern
		var regex = RegEx.new()
		regex.compile("\\{([a-z_]+:)?([a-z_]+)\\}")
		return regex

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

# region: Actions


func render() -> void:
	for result in pattern.search_all(template):
		var handler = ("%s" % result.get_string(1)).replace(":", "")
		var key = "%s" % result.get_string(2)
		if not (key in Variables) and not (handler in Variables):
			continue

		var value = "N/A"
		if handler in Variables:
			value = Variables[handler].call(key)

		if key != "" and key in Variables:
			value = Variables[key].call() if Variables[key] is Callable else Variables[key]

		var rendered = template.replace("{%s:%s}" % [handler, key], "%s" % value)
		self.text = rendered.replace("{%s}" % key, "%s" % value)

# endregion
