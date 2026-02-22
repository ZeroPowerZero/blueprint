extends Control

@export var state_scene: PackedScene
var state_count := 0
var states := []
var final_state = null

@onready var canvas: Control = $EditorRoot/Canvas
@onready var editor_root: Node2D = $EditorRoot

#UI
@onready var from_state: LineEdit = $CanvasLayer/UI/VBoxContainer/from_state
@onready var to_state: LineEdit = $CanvasLayer/UI/VBoxContainer/to_state
@onready var input_symbol: LineEdit = $CanvasLayer/UI/VBoxContainer/input_symbol


func _on_add_state_button_pressed():
	print("add button pressed")
	var new_state = state_scene.instantiate()
	new_state.position =abs(canvas.position) + size/2
	
	var new_name = "q" + str(state_count)
	
	new_state.state_name = new_name

	update_accepting_state(new_state)
	final_state = new_state
	canvas.add_child(new_state)
	states.append(new_state)
	
	state_count += 1

func update_accepting_state(new_state):
	if final_state:
		final_state.is_accepting = false
		final_state.update_visual()
	
	new_state.is_accepting = true
	final_state = new_state


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Main ready")

			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
		# Scroll → zoom
	if not Input.is_action_pressed("shift"):
		if Input.is_action_pressed("Up"):
			canvas.position.y-= 10
		if Input.is_action_pressed("Down"):
			canvas.position.y+= 10
	if Input.is_action_pressed("Right"):
		canvas.position.x+= 10
	if Input.is_action_pressed("Left"):
		canvas.position.x-= 10


func _on_add_transitio_button_pressed() -> void:
	pass # Replace with function body.
