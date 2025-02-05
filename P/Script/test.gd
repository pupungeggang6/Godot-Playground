extends Node

const data = [
    {"type": "platform", "data": {"size": Vector2(160, 40), "path": [Vector2(100, 100), Vector2(500, 500)]}},
    {"type": "platform", "data": {"size": Vector2(160, 40), "path": [Vector2(500, 500), Vector2(900, 100), Vector2(900, 500)]}}
]

func _ready():
    for i in range(len(data)):
        if data[i]["type"] == "platform":
            var temp = load("res://Scene/Thing/platform.tscn").instantiate()
            add_child(temp)
            temp.construct(data[i]["data"])
        
func _process(delta):
    pass
