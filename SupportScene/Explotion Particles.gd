extends Particles2D

func _ready():
	$"LifeTimer".wait_time = lifetime
	$LifeTimer.start()

func _on_LifeTimer_timeout():
	call_deferred("queue_free")
