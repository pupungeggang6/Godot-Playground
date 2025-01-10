extends Node2D

var jump_num = 0

func _ready():
    position.x = 320
    position.y = 320
    
func _process(delta: float):
    handle_input()
    move_player(delta)

func handle_input():
    pass
    
func move_player(delta):
    if Var.key_pressed['left'] == true:
        position.x -= 200.0 * delta
    if Var.key_pressed['right'] == true:
        position.x += 200.0 * delta
