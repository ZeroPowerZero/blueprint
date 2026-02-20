extends Camera2D

var draging := true
var last_mouse_pos := Vector2.ZERO
var block_pan := false

func _input(event):
	
	if event is InputEventMouseMotion:
		
		if event is InputEventMouseButton:
			if event.button_index  == MOUSE_BUTTON_MIDDLE:
				draging = true
			else:
				draging = false
		
		
	if event.is_action_pressed("drag"):
			print("hello dragg")
			var _delta = get_global_mouse_position() - last_mouse_pos
			position -= _delta * zoom
			last_mouse_pos = get_global_mouse_position()
	else :
		last_mouse_pos = Vector2(0,0)		
	# Middle mouse drag → pan
	if event is InputEventMouseButton  :
		#if event.button_index == MOUSE_BUTTON_MIDDLE:
			#draging = event.pressed
			#last_mouse_pos = event.position
		
		# Scroll → zoom
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			
			zoom *= 0.9
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			zoom *= 1.1
	




func _process(delta):
	pass

	
