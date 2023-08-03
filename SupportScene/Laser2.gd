extends RayCast2D

var is_casting = false setget set_is_casting

func _ready():
	set_physics_process(false)
	$Line2D.points[1] = Vector2.ZERO

func _physics_process(_delta):
	var cast_point = cast_to
	$Line2D.points[1] = cast_point
	$"CPU Spread Particles2".position = cast_point

func set_is_casting(cast):
	is_casting = cast
	$"CPU Spread Particles".set_emitting(is_casting)
	$"CPU Spread Particles2".set_emitting(is_casting)
	set_physics_process(is_casting)
