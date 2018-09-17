tool
extends Node2D
class_name PresentationPanel

export(float) var zoom = 1.0 setget set_zoom
export(Color) var bg_color = Color(1, 1, 1, 1) setget set_bg_color

func _ready():
	if Engine.editor_hint:
		return

func set_zoom(z):
	zoom = z
	update()

func get_vzoom():
	return Vector2(zoom, zoom)


func set_bg_color(c):
	bg_color = c
	update()

func _draw():
	if Engine.editor_hint:
		var size = Vector2(
			ProjectSettings.get('display/window/size/width'),
			ProjectSettings.get('display/window/size/height')
		)
		draw_rect(Rect2(-size*zoom/2, size*zoom), bg_color-Color(0, 0, 0, 0.8))
		draw_rect(Rect2(-size*zoom/2, size*zoom), Color(1, 0, 0, 0.5), false)
