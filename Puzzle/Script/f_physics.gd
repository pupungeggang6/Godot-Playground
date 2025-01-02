extends Node

func point_inside_node(point, node):
    var node_rect = node.get_rect()
    return point.x > node_rect.position.x and point.x < node_rect.position.x + node_rect.size.x and point.y > node_rect.position.y and point.y < node_rect.position.y + node_rect.size.y
