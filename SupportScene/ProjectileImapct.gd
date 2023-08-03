extends AnimatedSprite

func _ready():
	_set_playing(true)

func _on_ProjectileImapct_animation_finished():
	queue_free()
