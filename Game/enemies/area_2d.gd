extends Area2D
var health = 100
var Power = 5
var speed = 5
var armour = 5
var moral = 5

@export var exclusive = true
@export var selection_action = "select"
var selected: bool = false:
	set = set_selected

#handles the "selected group" to ensure that units are added/removed when clicked off
func set_selected(selection):
	if selection:
		_make_exclusive()
		add_to_group("selected")
	else:
		remove_from_group("selected") 
	selected = selection

# Checks to see if things arent sleected already
func _make_exclusive():
	if not selected:
		return
	get_tree().call_group("selected", "set_selected", false)

#changes selection type, if selected will unselect and visa versa
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("LeftClick"):
		set_selected(not selected)




 
var mousePos = Vector2()
var s = 0.5  

var mousePosGlobal = Vector2()



signal selection_toggled(selection)
