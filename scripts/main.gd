extends Control

@export var state_scene: PackedScene
var state_count := 0
@onready var canvas: Control = $EditorRoot/Canvas
@onready var editor_root: Node2D = $EditorRoot

func _on_add_state_button_pressed():
	print("add button pressed")
	var state = state_scene.instantiate()
	state.state_name = "q" + str(state_count)
	
	state.position =abs(canvas.position) + size/2
	$EditorRoot/Canvas.add_child(state)
	print(state.position)
	state_count += 1
	
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
