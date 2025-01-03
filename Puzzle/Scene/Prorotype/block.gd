extends Node2D

const block_pool = ['attack', 'shield', 'energy', 'scroll']
var type = ''

func generate_block(pos):
    var index = GResource.rand_gen.randi_range(0, 3)
    type = block_pool[index]
    if type == 'attack':
        get_node('Image').texture = GResource.tex_attack
    if type == 'shield':
        get_node('Image').texture = GResource.tex_shield
    if type == 'energy':
        get_node('Image').texture = GResource.tex_energy
    if type == 'scroll':
        get_node('Image').texture = GResource.tex_scroll
    position.x = pos.x
    position.y = pos.y

func change_type_to_empty():
    type = 'empty'
    hide()
