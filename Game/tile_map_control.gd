extends TileMap

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var global_clicked = event.position
			var pos_click = local_to_map(to_local(global_clicked))
			print(pos_click)
