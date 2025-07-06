extends CharacterBody2D

var mousePos = Vector2()
var s = 0.5  

var mousePosGlobal = Vector2()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var _global_clicked = event.position
