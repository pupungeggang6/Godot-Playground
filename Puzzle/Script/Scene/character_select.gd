extends Node2D

@onready var node_button_back = get_node('ButtonBack')

func _ready():
    pass

func _process(delta: float):
    if Input.is_action_just_pressed('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        handle_mouse(mouse)
        
func handle_mouse(mouse):
    if Var.menu == false:
        if Var.state == '':
            if FPhysics.point_inside_node(mouse, node_button_back):
                Var.state = ''
                Var.menu = false
                FGame.change_scene_to('res://Scene/Title.tscn', 'Title', self)
