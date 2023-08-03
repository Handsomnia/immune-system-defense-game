extends KinematicBody2D

#signal aoe_damage

var missile_damage
var target
export var speed = 5.0

func _ready():
	set_physics_process(false)
	#warning-ignore:return_value_discarded
#	get_parent().get_parent().
#	get_parent().connect("missile_launch", self, "launching")
	launching(target, missile_damage)
#	get_parent().get_node("Turrets/")
#	get_parent().connect("missile_launch", self, "launching")

func _physics_process(delta):
	if target != null and is_instance_valid(target):
		var direction = target.global_position - global_position
#		print (str(target.name) + str(target.position))
#		global_position.move_toward(target.global_position, )
		#warning-ignore:return_value_discarded
		move_and_collide(direction * speed * delta)
		if target == null:
			print ("hea")
	else:
##		set_physics_process(false)
		call_deferred("queue_free")

func launching(launch_target, damage):
	target = launch_target
	missile_damage = damage
#	print(str(launch_speed) + str(launch_target))
	set_physics_process(true)
#	if get_parent().get_parent().get_parent().is_connected("missile_launch", self, "launching"):
#		get_parent().get_parent().get_parent().disconnect("missile_launch", self, "launching")


func _on_Trigger_body_entered(body):
	if body.get_parent() == target:
		set_physics_process(false)
		$"Trigger/CollisionShape2D".set_deferred("disabled", true)
		$"Explosion/CollisionShape2D".set_deferred("disabled", false)

func _on_Explosion_body_entered(body):
#	print (body.get_parent().name)
	if body.get_parent().is_in_group("Attacker"):
		body.get_parent().on_hit(missile_damage, "AOE")
		$"Explosion/CollisionShape2D".set_deferred("disabled", true)
		call_deferred("queue_free")
