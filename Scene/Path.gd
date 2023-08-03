extends Path2D
signal empty_wave

func _ready():
	set_process(false)

func _process(_delta):
	if self.get_child_count() <= 0:# and get_parent().get_parent().is_running == true:
		emit_signal("empty_wave")
#		set_process(false)
