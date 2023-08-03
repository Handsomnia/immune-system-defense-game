extends Node2D

onready var first_pos = get_node("../Position2D")
onready var next_pos = get_node("../Position2D2")

onready var tween = get_node("Tween")

var move_speed = 500

func _ready():
#	position = first_pos.position

	print(first_pos.position)
	print(next_pos.position)
	print(first_pos.position - next_pos.position)

#func _process(delta):
	
#	position.x += move_speed * delta
#	if position.x >= next_pos.position.x:
#		position.x = next_pos.position.x


func _on_Button_button_down():
	tween.interpolate_property(self, "position", first_pos.position, next_pos.position, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property($Sprite, "scale", Vector2(0.5, 0.5), Vector2(1.5, 1.5), 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property($Sprite, "scale", Vector2(1.5, 1.5), Vector2(0.5, 0.5), 0.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.75)
	tween.start()






