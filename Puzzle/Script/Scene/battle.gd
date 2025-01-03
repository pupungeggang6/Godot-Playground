extends Node2D

@onready var node_board = get_node('Board')

var row = 9
var col = 9
var block = []

func _ready():
    node_board.generate_board(9, 9)
    
func _process(delta: float):
    pass
