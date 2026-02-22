extends Control

@export var state_scene: PackedScene
@export var transition_scene : PackedScene
var state_count := 0
var states := []
var final_state = null

@onready var canvas: Control = $EditorRoot/Canvas
@onready var editor_root: Node2D = $EditorRoot

#UI-vbox-contation for transition
@onready var from_state: LineEdit = $CanvasLayer/UI/VBoxContainer/from_state
@onready var to_state: LineEdit = $CanvasLayer/UI/VBoxContainer/to_state
@onready var input_symbol: LineEdit = $CanvasLayer/UI/VBoxContainer/input_symbol

#input workign container
@onready var input_string: LineEdit = $CanvasLayer/UI/Input_working_container/Input_string
@onready var validation_button: Button = $CanvasLayer/UI/Input_working_container/validation_button


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
		
#func to get state just by name
func get_state_by_name(name: String):
	for s in states:
		if s.state_name == name:
			return s
	return null

func _on_add_transitio_button_pressed() -> void:
	var from_name = from_state.text.strip_edges()
	var to_name = to_state.text.strip_edges()
	var symbol = input_symbol.text.strip_edges()

	if from_name == "" or to_name == "" or symbol == "":
		print("Missing fields")
		return
	
	var from_node = get_state_by_name(from_name)
	var to_node = get_state_by_name(to_name)
	
	if from_node == null or to_node == null:
		print("Invalid state name")
		return

	# 1️. Store transition in dictionary
	from_node.transitions[symbol] = to_node

	# 2️. Draw transition visually
	draw_transition(from_node, to_node, symbol)

func draw_transition(from_node, to_node, symbol):
	var transition = transition_scene.instantiate()
	
	canvas.add_child(transition)
	
	transition.setup(from_node, to_node, symbol)


func _on_validation_button_pressed() -> void:
	var input = input_string.text.strip_edges()
	
	if states.size() == 0:
		print("No states")
		return
	
	var current_state = states[0]   # q0
	
	print("Start at:", current_state.state_name)
	
	for char in input:
		if current_state.transitions.has(char):
			current_state = current_state.transitions[char]
			print("Move to:", current_state.state_name)
		else:
			print("Rejected (missing transition)")
			return
	
	if current_state.is_accepting:
		print("ACCEPTED ")
	else:
		print("REJECTED ")
