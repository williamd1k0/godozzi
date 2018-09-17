extends Sprite

export(bool) var cursor_enabled = true
export(float) var sleep_time = 5.0
var sleep_time_acc = 0

func _ready():
	Input.warp_mouse_position(OS.window_size/2)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	call_deferred('hide')

func _input(event):
	if cursor_enabled and event is InputEventMouseMotion:
		position = get_global_mouse_position()
		visible = true
	elif event.is_action_pressed("toggle_cursor"):
		if visible or not cursor_enabled:
			cursor_enabled = not cursor_enabled
		visible = cursor_enabled

func _process(delta):
	if cursor_enabled:
		var movement = Vector2(0, 0)
		if Input.is_action_pressed("cursor_up"):
			movement.y -= 1
		elif Input.is_action_pressed("cursor_down"):
			movement.y += 1
		if Input.is_action_pressed("cursor_left"):
			movement.x -= 1
		elif Input.is_action_pressed("cursor_right"):
			movement.x += 1
		if movement != Vector2():
			visible = true
			var pos = position + movement*delta*60*10
			var screen = OS.window_size
			pos.x = clamp(pos.x, 0, screen.x)
			pos.y = clamp(pos.y, 0, screen.y)
			position = pos
			sleep_time_acc = 0
		else:
			sleep_time_acc += delta
			if sleep_time_acc >= sleep_time:
				sleep_time_acc = 0
				visible = false

