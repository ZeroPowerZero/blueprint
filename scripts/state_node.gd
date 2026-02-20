# State Node Script for Visual State Nodes

extends Node

# Define your state node class here
class_name StateNode

var state_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Function to change the state
func change_state(new_state: String):
    state_name = new_state
    # Add logic to handle state change here

# Function to get current state
func get_current_state() -> String:
    return state_name