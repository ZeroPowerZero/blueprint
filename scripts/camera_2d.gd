extends Camera2D

var drag := false
var last_mouse_pos := Vector2.ZERO

func _unhandled_input(event):
	# Middle mouse drag → pan
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			drag = event.pressed
			last_mouse_pos = event.position

		# Scroll → zoom
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			zoom *= 0.9
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			zoom *= 1.1

	if event is InputEventMouseMotion and drag:
		var delta = event.position - last_mouse_pos
		position -= delta * zoom
		last_mouse_pos = event.position
