extends Node2D

func _ready():
    pass

func _process(delta):
    if Input.is_action_just_released("mouse"):
        var scene = load("res://Scene/game.tscn").instantiate()
        queue_free()
        get_tree().root.add_child(scene)
