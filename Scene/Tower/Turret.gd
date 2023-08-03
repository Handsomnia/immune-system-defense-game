extends Node2D

signal add_cash
signal use_cash(amount)

var type
var enemy_array = []
var built = false
var enemy
var ready = true
var category
var tower_level = 1
var tower_max_level = 3

var built_on #placing

var damage
var fire_range
var fire_rate
var effect_duration
var effect_amount
#var hp
var upgrade_cost

var is_lasering = false

func _ready():
	if built:
		damage = GameData.tower_data[type]["damage"]
		fire_rate = GameData.tower_data[type]["rof"]
		fire_range = GameData.tower_data[type]["range"]
		upgrade_cost = GameData.tower_data[type]["cost"] * 2.0
		#warning-ignore:return_value_discarded
		if self.category == "Producer":
			get_node("ProductionTimer").wait_time = fire_rate
			get_node("ProductionTimer").start()
		if self.category == "Slow":
			effect_duration = GameData.tower_data[type]["effect_duration"]
			effect_amount = GameData.tower_data[type]["s_percentage"]
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * GameData.tower_data[type]["range"]
		update_tower()
		#warning-ignore: return_value_discarded
		$"CanvasLayer/TowerDialog/VBoxContainer/UpgradeButtonContainer/UpgradeContainer/UpgradeButton".connect("pressed", self, "_on_UpgradeButton_pressed")
		$"CanvasLayer/TowerDialog/VBoxContainer/UpgradeButtonContainer/SellContainer/SellButton".connect("pressed", self, "_on_SellButton_pressed")

		ConfigManager.load_settings()
		if has_node("SoundEffect"):
			$"SoundEffect".volume_db = ConfigManager._settings["audio"]["sfx_volume"]


func _physics_process(_delta): # sebelumnya: physics_process
	
	if enemy_array.size() != 0 and built:
		select_enemy()
		if category == "Laser":
			fire_laser()
		if not get_node("AnimationPlayer").is_playing():
			turn()
		if ready:
			fire()
	else:
		enemy = null
		if get_node("Turret/Muzzle/MuzzleFlash").visible == true:
			get_node("Turret/Muzzle/MuzzleFlash").visible = false
			

func produce_cash(cash_amount):
#	print("produce cash")
	emit_signal("add_cash", cash_amount)

func fire():
	ready = false
	if category == "Projectile":
		fire_gun()
	elif category == "AOE":
		fire_missile()
	elif category == "Laser":
#		fire_laser()
		pass
	elif category == "Slow":
		fire_slow()
	if category != "AOE" and category != "Slow":
		enemy.on_hit(damage, category)
#	if is_instance_valid(self):
	$"ShootTimer".wait_time = fire_rate
	$"ShootTimer".start()
	yield($"ShootTimer", "timeout")
	ready = true

func fire_slow():
	var missile = load("res://Assets/Effect/SlowProjectile2.tscn").instance()
	var missile_pos = $Turret/Muzzle
	var missile_spawn = get_parent().get_parent()
	missile_spawn.add_child(missile)
#	ff3e3e
	if tower_level == 2:
		missile.get_node("Sprite").modulate = Color("ff3e3e")
	elif tower_level == 3:
		missile.get_node("Sprite").modulate = Color("50ff3e")
	missile.global_position = missile_pos.global_position
	missile.rotation_degrees = missile_pos.get_parent().rotation_degrees
	missile.scale = Vector2(0.25, 0.25)
	missile.missile_damage = damage
	missile.target = enemy
	missile.slow_duration = effect_duration
	missile.slowed_amount = effect_amount
#	emit_signal("slow_launch", enemy, damage, effect_duration, effect_amount)

func fire_laser():
	var enemy_impact_pos = enemy.get_node("Body")
	var lightning = get_node("Turret/Muzzle/MuzzleFlash/Lightning")
#	var laser = get_node("res://SupportScene/Laser2.tscn")
	
	var distance = lightning.global_position.distance_to(enemy_impact_pos.global_position)

	if tower_level == 2:
		lightning.modulate = Color("f8ff9a")
	if tower_level == 3:
		lightning.modulate = Color("ff3333")
	lightning.cast_to = Vector2(distance, 0.0)
	lightning.set_is_casting(true)
	
	get_node("Turret/Muzzle/MuzzleFlash").visible = true
	

	$"SoundEffect".play()



func fire_gun():
	get_node("AnimationPlayer").play("Fire")

func fire_missile():
	var missile = load("res://Assets/Effect/Missile2.tscn").instance()
	var missile_pos = $Turret/Muzzle
	var missile_spawn = get_parent().get_parent()
	missile_spawn.add_child(missile)
	if tower_level == 2:
		missile.get_node("Sprite").modulate = Color("f6ff59")
	elif tower_level == 3:
		missile.get_node("Sprite").modulate = Color("ff3e3e")
	missile.global_position = missile_pos.global_position
	missile.rotation_degrees = missile_pos.get_parent().rotation_degrees + 137.3
	missile.scale = Vector2(0.25, 0.25)
	missile.missile_damage = damage
	missile.target = enemy
	

	

func turn():
	get_node('Turret').look_at(enemy.position)

func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]

func _on_Range_body_entered(body):
	if body.get_parent().is_in_group("Attacker"):
		enemy_array.append(body.get_parent())


func _on_Range_body_exited(body):
	if body.get_parent().is_in_group("Attacker"):
		enemy_array.erase(body.get_parent())

func _on_ProductionTimer_timeout():
	produce_cash(5.0)

func _on_TouchScreenButton_pressed():
	if built:
		get_node("CanvasLayer/TowerDialog").popup_centered()
#		$"CanvasLayer/TowerDialog".rect_position = position - $"CanvasLayer/TowerDialog".rect_size/2

func _on_Body_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("ui_accept"):
		get_node("CanvasLayer/TowerDialog").popup_centered()

func update_tower():
	$"CanvasLayer/TowerDialog/VBoxContainer/TowerName".text = str(GameData.tower_data[type]["name"])+" Level "+str(tower_level)
	$"CanvasLayer/TowerDialog/VBoxContainer/VBoxContainer/DamageContainer/Damage".text = str(damage)
	$"CanvasLayer/TowerDialog/VBoxContainer/VBoxContainer/RangeContainer/Range".text = str(fire_range)
	$"CanvasLayer/TowerDialog/VBoxContainer/VBoxContainer/FireRateContainer/FireRate".text = str(fire_rate)
	if tower_level < tower_max_level:
		$"CanvasLayer/TowerDialog/VBoxContainer/VBoxContainer/UpgradeCostContainer/UpgradeCost".text = "$" + str(upgrade_cost)
	else:
		$"CanvasLayer/TowerDialog/VBoxContainer/VBoxContainer/UpgradeCostContainer/UpgradeCost".text = str("Tower level is max")

func _on_UpgradeButton_pressed():
	if tower_level < tower_max_level:
		var theGame = get_parent().get_parent().get_parent()
		if theGame.cash >= upgrade_cost:
			emit_signal("use_cash", upgrade_cost)
			upgrade_cost *= 2.0
			tower_level += 1
			if category != "Producer":
				damage += damage
				fire_range += 2.0
				#ubah collision range-nya
				if fire_rate > 0.02:
					fire_rate -= 0.02
			elif category == "Producer":
				fire_rate -= 1.0
				get_node("ProductionTimer").wait_time = fire_rate
#				print ("B-Cell")
	#	else:
	#		fire_rate = fire_rate
			evolve_tower(tower_level)
			update_tower()

func evolve_tower(to_level):
	if type == "Complementary":
		var evolve_texture
		if to_level == 2:
			evolve_texture = load("res://Assets/Towers/complementary_top_level_2.png")
		elif to_level == 3:
			evolve_texture = load("res://Assets/Towers/complementary_top_level_3.png")
		$Turret.texture = evolve_texture
	if type == "Macrophage":
		var evolve_texture1
		var evolve_texture2
		if to_level == 2:
			evolve_texture1 = load("res://Assets/Towers/macrophage_cannon_level_2.png")
			evolve_texture2 = load("res://Assets/Towers/macrophage_top_canon_level_2.png")
		elif to_level == 3:
			evolve_texture1 = load("res://Assets/Towers/macrophage_cannon_level_3.png")
			evolve_texture2 = load("res://Assets/Towers/macrophage_top_canon_level_3.png")
		$Turret.texture = evolve_texture1
		$top.texture = evolve_texture2
	if type == "Neutrophils":
		var evolve_texture
		if to_level == 2:
			evolve_texture = load("res://Assets/Towers/neutrophil_canon_level_2.png")
		elif to_level == 3:
			evolve_texture = load("res://Assets/Towers/neutrophil_canon_level_3.png")
		$Turret.texture = evolve_texture
	if type == "TCell":
		var evolve_texture
		if to_level == 2:
			evolve_texture = load("res://Assets/Towers/tcell_base_level_2.png")
		elif to_level == 3:
			evolve_texture = load("res://Assets/Towers/tcell_base_level_3.png")
		$Base.texture = evolve_texture
	if type == "BCell":
		var evolve_texture
		if to_level == 2:
			evolve_texture = load("res://Assets/Towers/bcell_tower_level_2.png")
		elif to_level == 3:
			evolve_texture = load("res://Assets/Towers/bcell_tower_level_3.png")
		$Turret.texture = evolve_texture
	

func _on_SellButton_pressed():#"Placings/Placing2"
#	produce_cash(GameData)
	produce_cash(GameData.tower_data[type]["cost"]/2.0)
	var theGame = get_parent().get_parent().get_parent()
#	print(str(theGame.get_node(theGame.map+"/Placings/"+built_on).name))
	theGame.get_node(theGame.map+"/Placings/"+built_on+"/CollisionShape2D").disabled = false
	queue_free()





