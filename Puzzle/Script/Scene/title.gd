extends Node2D

@onready var node_button_start = get_node('ButtonStart')
@onready var node_button_erase = get_node('ButtonErase')

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
                Var.state = ''
                Var.menu = false
                FGame.change_scene_to('res://Scene/character_select.tscn', 'CharacterSelect', self)
                
            elif FPhysics.point_inside_node(mouse, node_button_erase):
                Save.erase_data()
