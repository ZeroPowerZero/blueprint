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
	var offset = normal * 10
	
	curve.add_point(start)
	curve.add_point(mid + offset)
	curve.add_point(end)
	
	line.points = curve.get_baked_points()
	label.position = mid + offset
	label.scale = Vector2(2,2)
	
	queue_redraw()   # 🔥 needed for arrow


func _draw():
	if from_state == null or to_state == null:
		return
	
	var end = to_state.position
	var start = from_state.position
	
	var dir = (end - start).normalized()
	
	var arrow_size = 30
	
	var p1 = end
	var p2 = end - dir * arrow_size + Vector2(-dir.y, dir.x) * (arrow_size / 2)
	var p3 = end - dir * arrow_size + Vector2(dir.y, -dir.x) * (arrow_size / 2)
	
	draw_polygon([p1, p2, p3], [Color.DODGER_BLUE])
