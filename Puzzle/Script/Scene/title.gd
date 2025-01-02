extends Node2D

@onready var node_button_start = get_node('ButtonStart')

func _ready():
    Save.load_data()

func _process(delta: float):
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        handle_mouse(mouse)
    
func handle_mouse(mouse):
    if Var.menu == false:
        if Var.state == '':
            if FPhysics.point_inside_node(mouse, node_button_start):
                FGame.change_scene_to('res://Scene/character_select.tscn', 'CharacterSelect', self)
