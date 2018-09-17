extends Node2D

export(float) var cursor_scale = 1.0
onready var panels = $Panels
onready var camera = $PresentationCamera
var current_index = 0
var current_panel


func _ready():
	if not panels:
		$HUD/Info.text = 'No "Panels" root was found.'
	else:
		update_current_panel()
	$HUD/Cursor.scale = Vector2(cursor_scale, cursor_scale)

func _input(event):
	if panels:
		if event.is_action_pressed("panel_next"):
			next()
		elif event.is_action_pressed("panel_prev"):
			prev()
	if event.is_action_pressed('fullscreen'):
		OS.window_fullscreen = not OS.window_fullscreen

func move_to_panel(panel):
	$HUD/Cursor.hide()
	$Background.bg_color(panel.bg_color)
	camera.move_to(panel.global_position)
	camera.interpolate_zoom(panel.get_vzoom())

func update_current_panel():
	if current_panel == null or current_index != current_panel.get_index():
		current_panel = panels.get_child(current_index)
		move_to_panel(current_panel)

func next():
	current_index = min(current_index+1, panels.get_child_count()-1)
	update_current_panel()

func prev():
	current_index = max(current_index-1, 0)
	update_current_panel()

