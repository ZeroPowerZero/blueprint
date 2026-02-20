extends Node2D

# Bezier curve line drawing for transitions between states

# Function to draw a bezier curve
func draw_bezier(start: Vector2, control: Vector2, end: Vector2, segments: int = 100) -> PoolVector2Array:
    var curve_points : PoolVector2Array = PoolVector2Array()
    for i in range(segments + 1):
        var t = i / float(segments)
        curve_points.append(((1 - t) * (1 - t) * start + 2 * (1 - t) * t * control + t * t * end))
    return curve_points

# Function to visualize the bezier curve in _draw()
func _draw():
    var start = Vector2(100, 100)
    var control = Vector2(300, 50)
    var end = Vector2(500, 100)
    var curve_points = draw_bezier(start, control, end)
    for i in range(curve_points.size() - 1):
        draw_line(curve_points[i], curve_points[i + 1], Color(1, 0, 0)) # Draw in red

# This function can be called to update the drawing when needed
func _ready():
    update()