extends Node2D

var size = Vector2(0, 0)
var path = []
var d_index = 1
var speed = 200.0
@onready var node_texture = get_node("Bar/Texture")
@onready var node_bar = get_node("Bar")
@onready var node_path = get_node("Path")
@onready var node_pathline = get_node("Path/Pathline")

func set_data(data):
    size = data["size"]
    path = data["path"].duplicate(true)
    speed = data["speed"]
    
func _ready():
    pass
    
func _process(delta):
    move(delta)
    
func construct(data):
    set_data(data)
    node_texture.position = Vector2(0, 0)
    var temp_image = Image.new()
    var temp_texture = ImageTexture.new()
    temp_image = Image.create(size.x, size.y, false, Image.FORMAT_RGBA8)
    temp_image.fill(Color(1, 1, 1, 1))
    temp_texture = ImageTexture.create_from_image(temp_image)
    node_texture.texture = temp_texture
    node_bar.position = path[0]
    
    for i in range(len(path)):
        var temp_node = Sprite2D.new()
        temp_node.position = path[i]
        temp_image = Image.new()
        temp_texture = ImageTexture.new()
        temp_image = Image.create(20, 20, false, Image.FORMAT_RGBA8)
        temp_image.fill(Color(1, 1, 0, 1))
        temp_texture = ImageTexture.create_from_image(temp_image)
        temp_node.texture = temp_texture
        node_path.add_child(temp_node)
    
    var temp_node = Line2D.new()
    temp_node.default_color = Color.BLACK
    temp_node.width = 4
    temp_node.closed = true
    temp_node.points = path.duplicate(true)
    node_path.add_child(temp_node)
    
func move(delta):
    var diff = path[d_index] - node_bar.position
    if diff.length() < 5:
        node_bar.position = path[d_index]
        d_index = (d_index + 1) % len(path)
    else:
        var diff_n = diff.normalized()
        node_bar.position += diff_n * speed * delta
