class_name State extends movement



var state_name : String
var transition := {}
var is_accepting := false

@onready var inner_circle: ColorRect = $InnerCircle
@onready var labelee: Label = $Label


func _ready() -> void:
	labelee.text = state_name
	self.name = state_name
	
	update_visual()

#func set_state_name(new_name :String):
	#state_name = new_name
	#labelee.clip_text = str(new_name)
	#self.name = new_name

func update_visual():
	if inner_circle:
		inner_circle.visible = is_accepting
