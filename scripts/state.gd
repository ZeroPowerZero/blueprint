class_name State extends movement
@export var state_name := "qo"
const inputSymbols=["a","b","*"]
var state
var name
var state_links:Dictionary[string,State]={}

func setUp(name,states:Dictionary):
	state_links=states
	self.name=name	
func sendTo(s:State):
	s.state=state
	
func compute():
	for pair in state_links:
		var char = pair.
		
	

func _process(delta: float) -> func:
	pass
