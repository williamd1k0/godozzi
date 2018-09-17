extends CanvasLayer


func _ready():
	$DynamicColor.rect_size = OS.window_size

func bg_color(c):
	$DynamicColor.dcolor = c
