extends Node2D

const UI = [
    [128, 128, 128, 128], [384, 128, 128, 128], [640, 128, 128, 128],
    [128, 384, 128, 128], [640, 384, 128, 128],
    [128, 640, 128, 128], [384, 640, 128, 128], [640, 640, 128, 128]
]
const texture_cut = [
    [0, 32, 32, 32], [0, 0, 32, 32], [32, 0, 32, 32], [64, 0, 32, 32], [96, 0, 32, 32]
]

var board = []
var covered = []
var exist = []
var board_node = []
var cover_node = []

var state = ''
var time_pause = 0
var clicked = [-1, -1]
var click_num = 0

var img
var texture

func _ready():
    img = Image.load_from_file("res://Texture.png")
    texture = ImageTexture.create_from_image(img)
    generate_board()

func _process(delta):
    game_loop(delta)
    if Input.is_action_just_released("mouse_left"):
        var pos = get_viewport().get_mouse_position()
        mouse_handle(pos)
    
func generate_board():
    var rng = RandomNumberGenerator.new()
    var board_full = [1, 1, 2, 2, 3, 3, 4, 4]
    board = []
    while len(board_full) > 0:
        var index = rng.randi_range(0, len(board_full) - 1)
        board.append(board_full.pop_at(index))
    covered = [1, 1, 1, 1, 1, 1, 1, 1]
    exist = [1, 1, 1, 1, 1, 1, 1, 1]
        
    for i in range(8):
        var node_temp = Sprite2D.new()
        node_temp.position = Vector2(UI[i][0], UI[i][1])
        node_temp.scale = Vector2(4, 4)
        node_temp.texture = texture
        node_temp.region_enabled = true
        node_temp.region_rect = Rect2(texture_cut[board[i]][0], texture_cut[board[i]][1], texture_cut[board[i]][2], texture_cut[board[i]][3])
        add_child(node_temp)
        board_node.append(node_temp)
        
    for i in range(8):
        var node_temp = Sprite2D.new()
        node_temp.position = Vector2(UI[i][0], UI[i][1])
        node_temp.scale = Vector2(4, 4)
        node_temp.texture = texture
        node_temp.region_enabled = true
        node_temp.region_rect = Rect2(0, 32, 32, 32)
        add_child(node_temp)
        cover_node.append(node_temp)
        
func game_loop(delta):
    if state == 'check':
        if time_pause < 0:
            state = ''
            time_pause = 0
            check_flipped(clicked[0], clicked[1])
        else:
            time_pause -= delta

func mouse_handle(pos):
    if state == '':
        for i in range(8):
            if point_inside_rect(pos, UI[i]):
                if exist[i] == 1 and covered[i] == 1:
                    covered[i] = 0
                    cover_node[i].hide()
                    
                    if click_num == 0:
                        click_num = 1
                        clicked[0] = i
                        
                    elif click_num == 1:
                        click_num = 0
                        clicked[1] = i
                        state = 'check'
                        time_pause = 1
                        
func check_flipped(a, b):
    if board[a] == board[b]:
        exist[a] = 0
        exist[b] = 0
        board_node[a].hide()
        board_node[b].hide()
    else:
        cover_node[a].show()
        cover_node[b].show()
        covered[a] = 1
        covered[b] = 1
        
    clicked = [-1, -1]
    
func point_inside_rect(point, rect):
    return point.x > rect[0] - rect[2] / 2 and point.x < rect[0] + rect[2] / 2 and point.y > rect[1] - rect[3] / 2 and point.y < rect[1] + rect[3] / 2
