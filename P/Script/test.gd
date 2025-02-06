extends Node

const data = [
    {"type": "wall", "data":{"position": Vector2(800, 500), "size": Vector2(200, 40)}}
]

func _ready():
    for i in range(len(data)):
        if data[i]["type"] == "platform":
            var temp = load("res://Scene/Thing/platform.tscn").instantiate()
            add_child(temp)
            temp.construct(data[i]["data"])
            
        if data[i]["type"] == "wall":
            var temp = load("res://Scene/Thing/wall.tscn").instantiate()
            add_child(temp)
            temp.construct(data[i]["data"])
        
func _process(delta):
    handle_input()
    
func handle_input():
    for k in Var.key:
        if Input.is_action_just_pressed(k):
            Var.key[k] = true
        if Input.is_action_just_released(k):
            Var.key[k] = false
