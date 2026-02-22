extends Node2D

var from_state
var to_state
var symbol : String

@onready var line = $Line2D
@onready var label = $Label


func setup(from_node, to_node, input_symbol):
	from_state = from_node
	to_state = to_node
	symbol = input_symbol
	
	label.text = symbol


func _process(_delta):
	if from_state == null or to_state == null:
		return
	
	update_curve()


func update_curve():
	var start = from_state.position
	var end = to_state.position
	
	var curve = Curve2D.new()
	
	var mid = (start + end) / 2
	var direction = (end - start).normalized()
	var normal = Vector2(-direction.y, direction.x)
	var offset = normal * 80
	
	curve.add_point(start)
	curve.add_point(mid + offset)
	curve.add_point(end)
	
	line.points = curve.get_baked_points()
	label.position = mid + offset
