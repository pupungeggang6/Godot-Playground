extends Node

func change_scene_to(target_scene_path, target_scene_name, current_scene):
    var scene = load(target_scene_path).instantiate()
    scene.name = target_scene_name
    current_scene.queue_free()
    get_tree().root.add_child(scene)
