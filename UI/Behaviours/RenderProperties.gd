extends Label

@export var inspected_object: Node
@export var update_on_ready = true
@export var update_on_physics_process = false
@export var update_on_process = false

var template: String
var pattern: RegEx:
	get:
		if pattern != null:
			return pattern
		var regex = RegEx.new()
		regex.compile("\\{([a-z_]+)\\}")
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
	if inspected_object == null:
		return

	for result in pattern.search_all(template):
		var key = "%s" % result.get_string(1)
		if not (key in inspected_object):
			continue

		var value = (
			inspected_object[key].call()
			if inspected_object[key] is Callable
			else inspected_object[key]
		)
		self.text = template.replace("{%s}" % key, "%s" % value)

# endregion
