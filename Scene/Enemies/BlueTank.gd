extends PathFollow2D

signal base_damage(damage)
#signal turret_damage(damage)
signal die
signal add_cash

var normal_speed : float
var slowed_speed : float
var speed : float

var hp = 1000
#var turret_damage = 50
var base_damage = 18
var get_slowed = false

onready var health_bar = get_node("CanvasLayer/HealthBar")
onready var impact_area = get_node("Impact")

#var explosion_particel = preload("res://SupportScene/Explotion Particles.tscn")
var projectile_impact = preload("res://SupportScene/ProjectileImapct.tscn")

func _ready():
	$AnimationPlayer.play("Move")
	speed = normal_speed
	ConfigManager.load_settings()
	$"ExplosionSFX".volume_db = ConfigManager._settings["audio"]["sfx_volume"]
	
	health_bar.max_value = hp
	health_bar.value = hp
#	health_bar.set_as_toplevel(true)

func _physics_process(delta):
	if unit_offset == 1.0:
		emit_signal("base_damage", base_damage)
		set_physics_process(false)
		on_destroy()
#		queue_free()
	move(delta)

func move(delta):
	set_offset(get_offset() + speed * delta)
	health_bar.set_position(position - Vector2(30, 30))

func on_hit(damage, gun_type):
	if gun_type != "AOE":
		impact(gun_type)
	hp -= damage
	health_bar.value = hp
	if hp <= 0:
		on_destroy()

func impact(gun_type):
	if gun_type == "Projectile":
		randomize()
		var x_pos = randi() % 31
		randomize()
		var y_pos = randi() % 31
		var impact_location = Vector2(x_pos, y_pos)
		var new_impact = projectile_impact.instance()
		new_impact.position = impact_location
		impact_area.add_child(new_impact)

func on_destroy():
	speed = 0.0
#	var new_explosion = explosion_particel.instance()
	if has_node("Body/CollisionShape2D"):
		get_node("Body/CollisionShape2D").set_deferred("disabled", true)
		get_node("CanvasLayer/HealthBar").set_visible(false)
	get_node("Body").queue_free()
	get_node("Sprite").visible = false
#	new_explosion.position = position
#	new_explosion.z_index = 20
#	get_parent().get_parent().get_parent().add_child(new_explosion) # disesuaikan lagi ntar ini
#	new_explosion.emitting = true
	$"ExplosionAnim".play("explode")
	emit_signal("add_cash", 5)
	$"ExplosionSFX".play()
	yield(get_node("ExplosionAnim"), "animation_finished")
#	yield(get_node("ExplosionSFX"), "finished")
#	yield(get_tree().create_timer(0.2), "timeout")
	emit_signal("die")
	self.queue_free()

func slowed(duration, amount):
	if get_slowed == false:
		get_slowed = true
		slowed_speed = speed - (speed * amount/100.0)
		speed = slowed_speed
		$"EffectTimer".wait_time = duration
		$"EffectTimer".start()
	
func _on_EffectTimer_timeout():
	get_slowed = false
	speed = normal_speed
	$"EffectTimer".stop()
#func attacking():
#	speed = 0
#	emit_signal("turret_damage", turret_damage)
#	$"AttackTimer".start()
	

#func _on_AttackArea_area_entered(area):
#	if area.is_in_group("turret"):
#		attacking()
##		print ("attacking")


#func _on_AttackTimer_timeout():
#	attacking()



