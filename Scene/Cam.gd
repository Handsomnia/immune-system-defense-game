extends Camera2D

var touch_start_pos = Vector2()

const MIN_DISTANCE = 10

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_start_pos = event.position
		elif event.position.distance_to(touch_start_pos) > MIN_DISTANCE:
			var pan_vector = (event.position - touch_start_pos) / 10
			var camera_pos = position
			camera_pos -= pan_vector
			position = camera_pos
