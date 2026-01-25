extends Node2D

@export var state_name := "qo"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = state_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
