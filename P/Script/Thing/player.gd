extends Node2D

const g_accel = 400
const terminal_speed = 600.0
var speed = 200
var size = Vector2(80, 80)
var velocity = Vector2(0, 0)
var floating = true

func _ready():
    position.x = 800
    position.y = 0

func _process(delta):
    move(delta)
    
func move(delta):
    velocity.x = 0
    if Var.key["left"] == true:
        velocity.x += -speed
    if Var.key["right"] == true:
        velocity.x += speed
        
    if floating == true:
        if velocity.y >= terminal_speed:
            velocity.y = terminal_speed
        else:
            velocity.y += g_accel * delta
        
    position += velocity * delta
