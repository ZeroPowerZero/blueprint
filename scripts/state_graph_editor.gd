extends Node2D

var state_list = []
var transition_list = []

# Function to create a new state
func create_state(state_name: String): void:
    var state = {}  # Create a dictionary to hold state data
    state["name"] = state_name
    state["transitions"] = []  # List of transitions linked to this state
    state_list.append(state)  # Add to the state list

# Function to draw transitions
func draw_transition(start_state: String, end_state: String): void:
    var transition = {"from": start_state, "to": end_state}
    transition_list.append(transition)  # Store the transition

# Function to visually update the state graph
func update_visuals(): void:
    # Clear the current visuals
    pass  # Replace with code to clear visuals
    # Iterate over states and draw them
    for state in state_list:
        # Add code to draw state visually
        pass
    # Iterate over transitions and draw them
    for transition in transition_list:
        # Add code to draw transition visually
        pass

# Function to initialize the state graph editor
func _ready():
    # Call this function to set up any initial visuals
    update_visuals()