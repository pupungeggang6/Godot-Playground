extends Node2D

var size = Vector2(0, 0)
var path = []
var d_index = 1

@onready var node_img = get_node("Image")
@onready var player = get_node("../Player")

func set_data(data):
    position = data["position"]    
    size = data["size"]
    
func _ready():
    pass
    
func _process(delta):
    support_player()
    
func construct(data):
    set_data(data)
    node_img.position = Vector2(0, 0)
    var temp_image = Image.new()
    var temp_texture = ImageTexture.new()
    temp_image = Image.create(size.x, size.y, false, Image.FORMAT_RGBA8)
    temp_image.fill(Color(0, 1, 0, 1))
    temp_texture = ImageTexture.create_from_image(temp_image)
    node_img.texture = temp_texture
    
func support_player():
    var collision = Physics.get_v_collision(self, player)
    if collision > 0:
        player.floating = false
        player.velocity.y = 0
    player.position.y -= collision
