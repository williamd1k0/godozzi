tool
extends Node2D
class_name Panels

export(bool) var update_ setget set_update # manual update

func set_update(u):
	update()

func _draw():
	if Engine.editor_hint:
		var points = PoolVector2Array()
		for c in get_children():
			points.append(c.global_position)
		draw_polyline(points, Color(0, 1, 0, 0.2), 10.0)

