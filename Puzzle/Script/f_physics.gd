extends Node

func point_inside_node(point, node):
    return point.x > node.global_position.x and point.x < node.global_position.x + node.size.x and point.y > node.global_position.y and point.y < node.global_position.y + node.size.y

func point_inside_rect(point, rect):
    return point.x > rect[0] and point.x < rect[0] + rect[2] and point.y > rect[1] and point.y < rect[1] + rect[3]
    
func point_inside_rect_center(point, rect):
    return point.x > rect[0] - rect[2] / 2 and point.x < rect[0] + rect[2] / 2 and point.y > rect[1] - rect[3] / 2 and point.y < rect[1] + rect[3] / 2
