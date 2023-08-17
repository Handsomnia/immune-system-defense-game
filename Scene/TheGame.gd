extends Node2D

signal game_finished(result)
signal retry(scene)
#signal damage_turret(damage)

var map
var map_node

var build_mode = false
var build_valid = false
var build_tile
var build_location
var build_type

var wave_size
var wave_remaining
var current_wave = 0
var enemies_in_waves = 0
var wave_spawned = 0
var wave_finished = 0
var win = false

var cash = 20 #default 20
var base_health = 100 #default 100

var is_on_placing
var on_place

var touch_location
var drag_location
var events = {}

var camera_offset_min = -120.0
var camera_offset_max = 120.0

func _ready():
	
	wave_size = GameData.wave_data[map].size()
#	print (int(map.right(5)) + 1)
	wave_remaining = wave_size
	if map == "Level3":
		 cash = 40
	if map == "Level4":
		cash = 50
	if map == "Level5":
		cash = 60
	
	for i in wave_size: # get wave data in the fisrt instance of game
		enemies_in_waves += GameData.wave_data[map][str(i+1)].size()
	
	get_node("UI").update_cash(str(cash))
	#warning-ignore:return_value_discarded
	get_node("UI").connect("game_paused", self, "paused")
	
	var level = load("res://Scene/Levels/" +map+ ".tscn").instance() # get map
	add_child(level)
	
	map_node = get_node(map) # MAP -----> SESUAIKAN SAMA LEVEL

	for i in get_tree().get_nodes_in_group("placing"): # connect to all tower placings
		i.connect("mouse_entered", self, "on_placing", [i])
		i.connect("mouse_exited", self, "off_placing")
#		i.get_node("touch").connect("pressed", self, "tralala")
		
	for i in get_tree().get_nodes_in_group("build_buttons"): #connect to all tower build buttons in UI
		i.connect("button_down", self, "initiate_build_mode", [i.get_name()])
#		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])
	
	ConfigManager.load_settings()
	$"StartButtonSFX".volume_db = ConfigManager._settings["audio"]["sfx_volume"]


func _process(_delta):
#	if enemy_death_counter == enemies_in_waves and wave_remaining <= 0:
#		yield(get_tree().create_timer(2.0, false), "timeout")
#		emit_signal("game_finished", "win")
	if wave_spawned == wave_size and win == false and get_tree().get_nodes_in_group("Attacker").size() <= 0 and base_health > 0:
		win = true
		game_over()
#		emit_signal("game_finished", win)
	if build_mode:
		if !has_node("Cursor"):
			create_cursor()
		update_tower_preview()
		
	if $MainCamera.offset.x < camera_offset_min:
		$MainCamera.offset.x = lerp($MainCamera.offset.x, camera_offset_min + 5.0, 0.02)
	if $MainCamera.offset.y < camera_offset_min:
		$MainCamera.offset.y = lerp($MainCamera.offset.y, camera_offset_min + 5.0, 0.02)
	if $MainCamera.offset.x > camera_offset_max:
		$MainCamera.offset.x = lerp($MainCamera.offset.x, camera_offset_max + 5.0, 0.02)
	if $MainCamera.offset.y > camera_offset_max:
		$MainCamera.offset.y = lerp($MainCamera.offset.y, camera_offset_max + 5.0, 0.02)
#	if get_tree().get_nodes_in_group("enemy_in_wave1").size() <= 0:
#		print ("here")
#	if get_tree().has_group("enemy_in_wave" + str(current_wave)):
	get_node("UI/HUD/CenterContainer/numOfWaveCh").text = "Number of enemies : " + str ( get_tree().get_nodes_in_group("enemy_in_wave" + str(current_wave)).size())
#		print ("ada")

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_location = event.position
#			get_node("Cursor").global_position = event.position
#			print (get_node("Cursor").global_position)
#			print("touch down")
			# Handle touch down event
			pass
		elif event.is_pressed():
#			print("hold")
			pass
		else:
			pass
#			print("released")
			# Handle touch release event
			if build_mode == true:
#				get_node("Cursor/CollisionShape2D").disabled = true
				verivy_and_build()
				cancel_build_mode()
				if on_place != null:
					on_place.get_node("CollisionShape2D").disabled = true
					off_placing()
	if event is InputEventScreenDrag:
		drag_location = event.position
#	if event is InputEventScreenDrag and event.is_pressed():
##		if build_mode == true:
#		if has_node("Cursor"):
#			get_node("Cursor").global_position = event.get_positon()
##				get_node("Cursor/CollisionShape2D").disabled = true
#			verivy_and_build()
#			cancel_build_mode()
#			if on_place != null:
#				on_place.get_node("CollisionShape2D").disabled = true
					
func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			events[event.index] = event
		else:
			events.erase(event.index)
	if event is InputEventScreenDrag:
		events[event.index] = event
		if events.size() == 1:
			$MainCamera.offset += event.relative * -1
			
#--------Mouse Version
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		if on_place != null:
			on_place.get_node("CollisionShape2D").disabled = true
		verivy_and_build()
		cancel_build_mode()

##
## Wave Function
##
func _on_PreparationTimer_timeout():
	pass # Replace with function body.
func start_next_wave():
	get_node("UI/HUD/ColorRect/H/CurrentWave").text = str(current_wave)
	get_node("UI/HUD/ColorRect/H/WaveSize").text = str(wave_size)
	var wave_data = retrieve_wave_data()
	if wave_spawned == 0:
		for i in 4:
			$"Timers/PreparationTimer".start()
			yield($"Timers/PreparationTimer", "timeout")
			get_node("UI/HUD/WarningContainer/WarningText").text = "Musuh muncul dalam : " + str(3-i)
#			print ("next wave in : "+str(5-i))
		get_node("UI/HUD/WarningContainer/WarningText").text = ""
#		yield(get_tree().create_timer(3.0, false), "timeout")
		spawn_enemies(wave_data)
	else:
		for i in 4:
			$"Timers/PreparationTimer".start()
			yield($"Timers/PreparationTimer", "timeout")
			get_node("UI/HUD/WarningContainer/WarningText").text = "Musuh muncul dalam : " + str(3-i)
#			print ("next wave in : "+str(5-i))
		get_node("UI/HUD/WarningContainer/WarningText").text = ""
		spawn_enemies(wave_data)


func retrieve_wave_data():
	var wave_data = GameData.wave_data[map][str(current_wave)]
	return wave_data
	

func spawn_enemies(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Scene/Enemies/" + i[0] + ".tscn").instance()
		new_enemy.connect("base_damage", self, "on_base_damage")
		new_enemy.connect("add_cash", self, "add_cash")
#		new_enemy.connect("turret_damage", self, "on_turret_damage")
		new_enemy.add_to_group("enemy_in_wave" + str(current_wave))
		new_enemy.hp = i[2]
		new_enemy.normal_speed = i[3]
#		map_node.get_node("Path").add_child(new_enemy, true)
		map_node.get_node("Paths/Path"+str(i[4])).add_child(new_enemy, true)
		$"Timers/EnemySpawnTimer".wait_time = i[1]
		$"Timers/EnemySpawnTimer".start()
		yield($"Timers/EnemySpawnTimer", "timeout")
	
	for i in get_node(map +"/Paths").get_child_count():
		get_node(map +"/Paths").get_child(i).set_process(true) #ubah ni woy
	yield(wave_finish(), "completed")
	if wave_spawned < wave_size:
		current_wave += 1
		wave_spawned += 1
	if wave_remaining > 0:
		wave_remaining -= 1
		start_next_wave()

func wave_finish():
	for i in get_node(map +"/Paths").get_child_count():
		yield(get_node(map +"/Paths").get_child(i), "empty_wave")
	
#	print ("der yu go")

##
## end of wave functions
##---------------------------------

##
## Building Function
##

func initiate_build_mode(tower_type):
#	print(tower_type)
	var tower_cost = GameData.tower_data[tower_type]["cost"]
	
#	print(str(initiate_tower))
	if get_node("UI/HUD/BuildBar/"+ tower_type +"/Cooldown").value > 0:
		get_node("UI/HUD/WarningContainer/WarningText").text = "Sedang Cooldown"
		yield(get_tree().create_timer(2.0), "timeout")
		get_node("UI/HUD/WarningContainer/WarningText").text = ""
	elif cash < tower_cost:
		get_node("UI/HUD/WarningContainer/WarningText").text = "Cash Tidak Cukup!"
		yield(get_tree().create_timer(2.0), "timeout")
		get_node("UI/HUD/WarningContainer/WarningText").text = ""
	else:
		if build_mode:
			cancel_build_mode()
		build_type = tower_type# + "T1"
		build_mode = true
		get_node("UI").set_tower_preview(build_type, get_global_mouse_position() - Vector2($MainCamera.offset))
#		get_node("UI").set_tower_preview(build_type, touch_location)

func update_tower_preview():
	var mouse_position = get_global_mouse_position()
#	var mouse_position
#	if drag_location != null:
#		mouse_position = drag_location
#	if drag_location == null:
#		mouse_position = get_global_mouse_position()
	get_node("Cursor").position = mouse_position
#	var touch_position = 
	
	if is_on_placing == true:
		get_node("UI").update_tower_preview(on_place.position - Vector2($MainCamera.offset), "ad54ff3c") # transparent green
		build_valid = true
		build_location = on_place.position
#		build_tile = current_tile
	else:
		get_node("UI").update_tower_preview(mouse_position - Vector2($MainCamera.offset), "adff4545") # transaprent red
		build_valid = false


func cancel_build_mode():
	if has_node("Cursor"):
		get_node("Cursor").queue_free()
	touch_location = null
	drag_location = null
	build_mode = false
	build_valid = false
#	if has_node("UI/TowerPreview"):
	get_node("UI/TowerPreview").free()

func verivy_and_build():
	var tower_cost = GameData.tower_data[build_type]["cost"]
	if build_valid and cash >= tower_cost:
		var new_tower = load("res://Scene/Tower/" + build_type + ".tscn").instance()
		new_tower.position = build_location
		new_tower.built = true
		new_tower.type = build_type
		new_tower.category = GameData.tower_data[build_type]["category"]
		new_tower.built_on = str(on_place.get_node(".").name)
		new_tower.get_node("Body/CollisionShape2D").disabled = false
		new_tower.connect("add_cash", self, "add_cash")
		new_tower.connect("use_cash", self, "use_cash")
		map_node.get_node("Turrets").add_child(new_tower, true)
#		map_node.get_node("TowerExclusion").set_cellv(build_tile, 5)
		
		cash -= tower_cost
		get_node("UI").update_cash(str(cash))
		var tower_ui = build_type
		get_node("UI/HUD/BuildBar/"+ tower_ui +"/Cooldown").value = 100
		get_node("UI/HUD/BuildBar/"+ tower_ui +"/cooldown_timer").start()
#		kurangi cash
#		update cash label

func create_cursor():
	var cursor_area = Area2D.new()
	var cursor_col = CollisionShape2D.new()
	cursor_area.name = "Cursor"
	add_child(cursor_area)
	cursor_area.add_child(cursor_col)
	cursor_col.shape = CircleShape2D.new()
	cursor_col.shape.radius = 10.0
	cursor_area.connect("area_entered", self, "_on_Cursor_area_entered")
	cursor_area.connect("area_exited", self, "_on_Cursor_area_exited")

func _on_Cursor_area_entered(area):
	if area.is_in_group("placing"):
		on_placing(area)

func _on_Cursor_area_exited(area):
	if area.is_in_group("placing"):
		off_placing()

func on_placing(place):
	is_on_placing = true
	on_place = place
	
#	print(str(is_on_placing) + " | " + str(on_place))

func off_placing():
	is_on_placing = false
	on_place = null
#	print(str(is_on_placing) + " | " + str(on_place))

##
## End of Building Function
##--------------------------------------------------------

#func on_turret_damage(dmg):
#	emit_signal("damage_turret", dmg)

func add_cash(cash_amount):
	cash += cash_amount
	get_node("UI").update_cash(str(cash))

func use_cash(cash_amount):
	cash -= cash_amount
	get_node("UI").update_cash(str(cash))

func on_base_damage(damage):
	base_health -= damage
	if base_health <= 0:
		get_node("UI").update_health_bar(base_health)
#		win = false
		game_over()
#		emit_signal("game_finished", false)
	else:
		get_node("UI").update_health_bar(base_health)

func paused():
	var pause_view = load("res://Scene/Pause View.tscn").instance()
	pause_view.connect("main_menu", self, "back_to_main_menu")
	pause_view.connect("level_selection", self, "back_to_level_selection")
	$UI.add_child(pause_view)

func game_over():
	Engine.set_time_scale(1.0)
	var game_over_view# = load("res://Scene/Game Over View.tscn").instance()
	if win == true:
		if map == "Level5":
			get_node(map).visible = false
			get_node("UI/HUD").visible = false
			$MainCamera.offset = Vector2.ZERO
			play_endgame_cutscene()
			yield(play_endgame_cutscene(), "completed")
		if map != "Level5": 
			ConfigManager._settings["level"][map.left(5) + str(int(map.right(5)) + 1)] = "unlocked"
			ConfigManager.save_settings()
		game_over_view = load("res://Scene/Level Complete View.tscn").instance()
			
		if base_health >= 66.7:
			ConfigManager._settings["level_stars"][str(map)] = 3
			ConfigManager.save_settings()
			for i in game_over_view.get_node("VBoxContainer/Results").get_child_count():
				game_over_view.get_node("VBoxContainer/Results").get_child(i).modulate = "fff43d"
		if base_health >= 33.4 and base_health < 66.7:
			if ConfigManager._settings["level_stars"][str(map)] < 2:
				ConfigManager._settings["level_stars"][str(map)] = 2
				ConfigManager.save_settings()
			game_over_view.get_node("VBoxContainer/Results").get_child(0).modulate = "fff43d"
			game_over_view.get_node("VBoxContainer/Results").get_child(1).modulate = "fff43d"
		if base_health < 33.4:
			if ConfigManager._settings["level_stars"][str(map)] < 1:
				ConfigManager._settings["level_stars"][str(map)] = 1
				ConfigManager.save_settings()
			game_over_view.get_node("VBoxContainer/Results").get_child(0).modulate = "fff43d"
			
		if map == "Level5":
			if game_over_view.has_node("VBoxContainer/ButtonContainer/NextLevelButton"):
				game_over_view.get_node("VBoxContainer/ButtonContainer/NextLevelButton").visible = false
		game_over_view.connect("main_menu", self, "back_to_main_menu")
		game_over_view.connect("next_level", self, "play_next_level")
		game_over_view.connect("level_selection", self, "back_to_level_selection")
	else:
		get_tree().paused = true
		game_over_view = load("res://Scene/Game Over View.tscn").instance()
		game_over_view.connect("main_menu", self, "back_to_main_menu")
		game_over_view.connect("level_selection", self, "back_to_level_selection")
		game_over_view.connect("retry", self, "retry")
	$UI.add_child(game_over_view)
	if get_tree().has_group("tower elements"):
		get_tree().call_group("tower elements", "stop")
	#	$UI.move_child(get_node("UI/Game Over View"), 0)
	$"Timers/GameOverTimer".start()
	yield($"Timers/GameOverTimer", "timeout")
	get_tree().call_group("Attacker", "queue_free")
#	if map == "Level5":
#		get_node(map).visible = false
#		get_node("UI/HUD").visible = false
#		$MainCamera.offset = Vector2.ZERO
#		play_endgame_cutscene()


func play_endgame_cutscene():
	var endgame_scene = load("res://Scene/Cutscenes/EndGameCutscene.tscn").instance()
	
	add_child(endgame_scene)
#	endgame_scene.get_node("Control/MarginContainer/TextureButton").connect("pressed", self, "test_endgame_pressed")
	var tween = endgame_scene.get_node("Tween")
	tween.interpolate_property(endgame_scene.get_node("Control/ColorRect"),
								 "color", Color("ffffffff"), Color("000000"),
								 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property(endgame_scene.get_node("Control/EpilogContainer"),
								 "modulate", Color("00ffffff"), Color("ffffffff"),
								 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
								
	yield(endgame_scene.get_node("Control/MarginContainer/TextureButton"), "pressed")
	
	tween.interpolate_property(endgame_scene.get_node("Control/EpilogContainer"),
								 "modulate", Color("ffffffff"), Color("00ffffff"),
								 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	
	tween.interpolate_property(endgame_scene.get_node("Control/CreditsContainer"),
								 "modulate", Color("00ffffff"), Color("ffffffff"),
								 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
								
	yield(endgame_scene.get_node("Control/MarginContainer/TextureButton"), "pressed")
	tween.interpolate_property(endgame_scene.get_node("Control/CreditsContainer"),
								 "modulate", Color("ffffffff"), Color("00ffffff"),
								 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	print ("selesai")

func play_next_level():
	var next_map = map.left(5) + str(int(map.right(5)) + 1)
	emit_signal("retry", "res://Scene/TheGame.tscn", next_map)

func back_to_main_menu():
	emit_signal("game_finished", null)

func back_to_level_selection():
	emit_signal("game_finished", "levels")

func retry():
#	get_children().clear()
#	for i in .get_child_count():
#	.remove_child(get_child(1))
#	.remove_child(get_child(0))
#	_ready()
#	for i in .get_child_count():
#		print(str(get_child(i).name + str(i)))
	emit_signal("retry", "res://Scene/TheGame.tscn", map)











































