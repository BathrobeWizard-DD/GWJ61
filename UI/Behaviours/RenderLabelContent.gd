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
		regex.compile("\\{([a-z:_]+)\\}")
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
		var key = result.get_string(1)
		if not (key in Variables):
			continue
		var value = Variables[key].call() if Variables[key] is Callable else Variables[key]
		self.text = template.replace("{%s}" % key, value)

# endregion
