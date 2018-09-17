extends Camera2D

const zoom_factor = Vector2(0.01, 0.01)
onready var tween = $Tween


func _process(delta):
	var movement = Vector2(0, 0)
	if Input.is_action_pressed("camera_up"):
		movement.y -= 1
	elif Input.is_action_pressed("camera_down"):
		movement.y += 1
	if Input.is_action_pressed("camera_left"):
		movement.x -= 1
	elif Input.is_action_pressed("camera_right"):
		movement.x += 1
	translate(movement*delta*60*10)
	if Input.is_action_pressed("zoom_in"):
		zoom_in()
	elif Input.is_action_pressed("zoom_out"):
		zoom_out()

func move_to(panel_pos):
	tween.interpolate_property(
		self,
		"global_position",
		global_position,
		panel_pos,
		1.0,
		Tween.TRANS_SINE,
		Tween.EASE_IN
	)
	tween.start()

func zoom_in():
	zoom -= zoom_factor

func zoom_out():
	zoom += zoom_factor

func interpolate_zoom(zoom_):
	tween.interpolate_property(
		self,
		"zoom",
		zoom,
		zoom_,
		1.0,
		Tween.TRANS_SINE,
		Tween.EASE_IN
	)
	tween.start()
