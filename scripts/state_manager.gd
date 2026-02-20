extends Node

# Global autoload script to manage the current state

var current_state : String = ""
var state_dictionary : Dictionary = {
    "initial": {},
    "state1": {},
    "state2": {}
}

# Function to change state
func change_state(new_state: String): void:
    if state_dictionary.has(new_state):
        current_state = new_state
        print("State changed to: " + current_state)
    else:
        print("State \"" + new_state + "\" does not exist!")

# Function to get the current state
func get_current_state() -> String:
    return current_state

# Function to handle state transitions based on input
func handle_input(input: String): void:
    match input:
        "next": change_state("state1")
        "previous": change_state("initial")
        _:
            print("Unknown input")
