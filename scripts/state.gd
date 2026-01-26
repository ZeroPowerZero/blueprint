extends Node2D

@export var state_name := "qo"

var dragging := false
var drag_offset := Vector2.ZERO
var last_mouse_pos = Vector2.ZERO

func is_mouse_over() -> bool:
	var mouse = to_local(get_global_mouse_position())
	
	return mouse.x > -40 and mouse.x < 40 and mouse.y > -40 and mouse.y < 40

func _input(event):
	# LEFT MOUSE BUTTON
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if is_mouse_over():
				print("mouse is over")
				dragging = true
				drag_offset = global_position - get_global_mouse_position()
				get_viewport().set_input_as_handled()
			else:
				dragging = false
		else:
			# mouse released
			dragging = false

	# MOUSE DRAG
	if event is InputEventMouseMotion and dragging:
		global_position = get_global_mouse_position() + drag_offset
		get_viewport().set_input_as_handled()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(is_mouse_over())
	$Label.text = state_name
	get_tree().get_first_node_in_group("camera").block_pan = false
	print(get_tree_string())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
