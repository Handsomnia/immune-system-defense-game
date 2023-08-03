extends KinematicBody2D

#signal aoe_damage

var missile_damage
var target
var slow_duration
var slowed_amount
export var speed = 5.0

func _ready():
	set_physics_process(false)
	#warning-ignore:return_value_discarded
	launching(target, missile_damage, slow_duration, slowed_amount)
#	get_parent().get_parent().get_parent().connect("slow_launch", self, "launching")
#	get_parent().connect("missile_launch", self, "launching")

func _physics_process(delta):
	if target != null and is_instance_valid(target):
		var direction = target.global_position - global_position
#		print (str(target.name) + str(target.position))
#		global_position.move_toward(target.global_position, )
		#warning-ignore:return_value_discarded
		move_and_collide(direction * speed * delta)
	else:
#		set_physics_process(false)
		call_deferred("queue_free")

func launching(launch_target, damage, effect_duration, slowed_percentage):
	target = launch_target
	missile_damage = damage
	slow_duration = effect_duration
	slowed_amount = slowed_percentage
#	print(str(launch_speed) + str(launch_target))
	set_physics_process(true)
#	if get_parent().get_parent().get_parent().is_connected("missile_launch", self, "launching"):
#		get_parent().get_parent().get_parent().disconnect("missile_launch", self, "launching")


func _on_Trigger_body_entered(body):
	if body.get_parent() == target:
		set_physics_process(false)
		$"Trigger/CollisionShape2D".set_deferred("disabled", true)
		body.get_parent().on_hit(missile_damage, "AOE")
		body.get_parent().slowed(slow_duration, slowed_amount)
		call_deferred("queue_free")
