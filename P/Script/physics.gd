extends Node

func get_v_collision(r1, r2):
    if r1.position.x - abs(r1.size.x + r2.size.x) / 2 < r2.position.x and r2.position.x < r1.position.x + abs(r1.size.x + r2.size.x) / 2:
        if abs(r1.position.y - r2.position.y) < abs(r1.size.y + r2.size.y) / 2:
            if r1.position.y > r2.position.y:
                return abs(r1.size.y + r2.size.y) / 2 - abs(r1.position.y - r2.position.y)
            else:
                return -(abs(r1.size.y + r2.size.y) / 2 - abs(r1.position.y - r2.position.y))
    return 0
