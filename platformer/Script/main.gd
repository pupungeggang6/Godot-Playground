extends Node

func _process(delta):
    handle_input()
    
func handle_input():
    if Input.is_action_just_pressed('left'):
        Var.key_pressed['left'] = true
    if Input.is_action_just_pressed('right'):
        Var.key_pressed['right'] = true
    if Input.is_action_just_pressed('jump'):
        Var.key_pressed['jump'] = true
        
    if Input.is_action_just_released('left'):
        Var.key_pressed['left'] = false
    if Input.is_action_just_released('right'):
        Var.key_pressed['right'] = false
    if Input.is_action_just_released('jump'):
        Var.key_pressed['jump'] = false
