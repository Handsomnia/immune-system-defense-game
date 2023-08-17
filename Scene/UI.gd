extends CanvasLayer

signal game_paused

var tower_range = 350

onready var hp_bar = get_node("HUD/ColorRect/H/HP")
onready var hp_bar_tween = get_node("HUD/ColorRect/H/HP/Tween")

func _ready():
	$"HUD/BuildBar/Complementary/CostLabel".text = str(GameData.tower_data["Complementary"]["cost"])
	$"HUD/BuildBar/Macrophage/CostLabel".text = str(GameData.tower_data["Macrophage"]["cost"])
	$"HUD/BuildBar/Neutrophils/CostLabel".text = str(GameData.tower_data["Neutrophils"]["cost"])
	$"HUD/BuildBar/TCell/CostLabel".text = str(GameData.tower_data["TCell"]["cost"])
	$"HUD/BuildBar/BCell/CostLabel".text = str(GameData.tower_data["BCell"]["cost"])
	
func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://Scene/Tower/" + tower_type + ".tscn").instance()
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("ad54ff3c")
	
	var range_texture = Sprite.new()
#	range_texture.position = Vector2(32, 32)
	var scaling = GameData.tower_data[tower_type]["range"] / 600.0
	range_texture.scale = Vector2(scaling, scaling)
	var texture = load ("res://Assets/range_overlay.png")
	range_texture.texture = texture
	range_texture.modulate = Color("ad54ff3c")
	
	var control = Control.new()
	control.add_child(drag_tower, true)
	control.add_child(range_texture, true)
	control.rect_position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
	move_child(get_node("TowerPreview"), 0)

func update_tower_preview(new_position, color):
	get_node("TowerPreview").rect_position = new_position
	if get_node("TowerPreview/DragTower").modulate != Color(color):
		get_node("TowerPreview/DragTower").modulate = Color(color)
		get_node("TowerPreview/Sprite").modulate = Color(color)

func update_health_bar(base_health):
#	hp_bar_tween.interpolate_property(node, parameter, start_value, end_value, duration, transition_type, easing_type)
	hp_bar_tween.interpolate_property(hp_bar, "value", hp_bar.value, base_health, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	hp_bar_tween.start()
	if base_health >= 60:
		hp_bar.set_tint_progress("4eff15") # green
	elif base_health <= 60 and base_health >= 25:
		hp_bar.set_tint_progress("e1be32") # Orange
	elif base_health < 25 and base_health > 0:
		hp_bar.set_tint_progress("d10015") #red
		hp_bar.get_node("AnimationPlayer").play("LowHp")
	else:
		hp_bar.set_tint_progress("2d2d2d") # base

func update_cash(cash):
	get_node("HUD/ColorRect/H/Cash").text = cash

##
## Game Control FUnctions
##
func _on_StartButton_pressed():
	$"../StartButtonSFX".play()
	yield(get_node("../StartButtonSFX"), "finished")
	get_parent().current_wave += 1
	get_parent().wave_remaining -= 1
	get_parent().start_next_wave()
	$"HUD/StartButtonContainer".hide()
	
func _on_Pause_pressed():
	if get_parent().build_mode:
		get_parent().cancel_build_mode()
#	if get_tree().is_paused():
#		get_tree().paused = false
#	elif get_parent().current_wave == 0:
#		get_parent().current_wave += 1
#		get_parent().wave_remaining -= 1
#		get_parent().start_next_wave()
	else:
		emit_signal("game_paused")
		get_tree().paused = true

func _on_SpeedUp_pressed():
	if get_parent().build_mode:
		get_parent().cancel_build_mode()
	if Engine.get_time_scale() == 8.0:#4.0
		Engine.set_time_scale(1.0)
	else:
		Engine.set_time_scale(8.0)#4.0

func cooldown(tower):
	var cooldown_time = GameData.tower_data[tower]["cooldown"]
	var cooldown = 100.0/cooldown_time
	var ui_tower = tower#.left(tower.length() - 2)
	if get_node("HUD/BuildBar/"+ ui_tower +"/Cooldown").value > 0:
#		get_node("HUD/BuildBar/Macrophage").set_disabled(true)
		get_node("HUD/BuildBar/"+ ui_tower +"/Cooldown").value -= cooldown
		get_node("HUD/BuildBar/"+ ui_tower +"/cooldown_timer").start()
		

func _buildbar_on_mouse():
	pass
#	$"HUD/BuildBar/Complementary"

func _on_macrophage_cooldown_timer_timeout():
	cooldown("Macrophage")

func _on_neutrophils_cooldown_timer_timeout():
	cooldown("Neutrophils")

func _on_complementary_cooldown_timer_timeout():
	cooldown("Complementary")

func _on_tcell_cooldown_timer_timeout():
	cooldown("TCell")

func _on_bcell_cooldown_timer_timeout():
	cooldown("BCell")
















































