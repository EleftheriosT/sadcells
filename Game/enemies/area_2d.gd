extends Area2D
var health = 100
var Power = 5
var speed = 5
var armour = 5
var moral = 5

@export var exclusive = true
@export var selection_action = "select"

var _selected := false  # backing variable
var selected: bool:
	set = set_selected,
	get = get_selected

signal selection_toggled(selection)

func set_selected(selection):
	if selection:
		_make_exclusive()
		add_to_group("selected")
	else:
		remove_from_group("selected")
	_selected = selection
	emit_signal("selection_toggled", selection)

func get_selected():
	return _selected

func _make_exclusive():
	if not _selected:
		return
	get_tree().call_group("selected", "set_selected", false)

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("LeftClick"):
		selected = not selected

func _on_selection_toggled(selection: Variant) -> void:
	$"../Label".visible = selection  # fixed typo
