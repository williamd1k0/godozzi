tool
extends ColorRect

onready var tween = $Tween
export(Color) var dcolor = Color(1, 1, 1) setget set_dcolor

func set_dcolor(c):
	dcolor = c
	call_deferred('update_color')

func update_color():
	tween = $Tween
	tween.interpolate_property(
		self,
		"color",
		color,
		dcolor,
		1.0,
		Tween.TRANS_SINE,
		Tween.EASE_IN
	)
	tween.start()
