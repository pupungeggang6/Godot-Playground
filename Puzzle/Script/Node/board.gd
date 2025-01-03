extends Node2D

@onready var node_rect = get_node('Rect')
@onready var node_block = get_node('Block')

var row = 9
var col = 9

var block = []
var selected = []

func _process(delta: float):
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        handle_mouse(mouse)
        
func handle_mouse(mouse):
    if Var.menu == false:
        if Var.state == 'start':
            Var.state = ''
        if Var.state == '':
            for i in range(row):
                for j in range(col):
                    var rect = [block[i][j].global_position.x, block[i][j].global_position.y, 64, 64]
                    if FPhysics.point_inside_rect_center(mouse, rect):
                        find_neighbor(i, j)

func generate_board(r, c):
    row = r
    col = c
    
    for i in range(row):
        var temp = []
        for j in range(col):
            var node_block_temp = load('res://Scene/Prorotype/block.tscn').instantiate()
            var pos = Vector2(-32 * (col - 1) + 64 * j, -32 * (row - 1) + 64 * i)
            node_block_temp.generate_block(pos)
            node_block.add_child(node_block_temp)
            temp.append(node_block_temp)
        block.append(temp)
    
    selected = generate_zero(row, col)

func handle_block_selected():
    for i in range(row):
        for j in range(col):
            if selected[i][j] == 1:
                block[i][j].get_node('SelectFrame').show()
            else:
                block[i][j].get_node('SelectFrame').hide()

func generate_zero(r, c):
    var board = []
    for i in range(r):
        var temp = []
        for j in range(c):
            temp.append(0)
        board.append(temp)
    return board

func find_neighbor(r, c):
    selected = generate_zero(row, col)
    var queue = []
    var type = block[r][c].type
    queue.append([r, c])
    
    while len(queue) > 0:
        var first = queue[0]
        selected[first[0]][first[1]] = 1
        queue.pop_front()
        
        for i in range(4):
            var next = [first[0] + Const.direction_info[i][0], first[1] + Const.direction_info[i][1]]
            if next[0] >= 0 and next[0] < row and next[1] >= 0 and next[1] < col:
                if block[next[0]][next[1]].type == type and selected[next[0]][next[1]] == 0:
                    queue.append(next)
    
    handle_block_selected()

func delete_selected():
    pass
    
func fall_handle():
    pass
