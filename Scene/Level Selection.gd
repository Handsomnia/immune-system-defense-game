extends Control

signal back
signal play

func _ready():
	ConfigManager.load_settings()
	$"ButtonSFX".volume_db = ConfigManager._settings["audio"]["sfx_volume"]
	for level_button in get_tree().get_nodes_in_group("level_button"):
		for i in ConfigManager._settings["level"]:
			if ConfigManager._settings["level"][i] == "locked":
				if i == level_button.name:
					level_button.disabled = true
	#			get_node("Container/Button Container/" + i).disabled = true
			if ConfigManager._settings["level"][i] == "unlocked":
				if i == level_button.name:
					level_button.disabled = false
	#			get_node("Container/Button Container/" + i).disabled = false
	for i in ConfigManager._settings["level_stars"]:
		if ConfigManager._settings["level_stars"][i] > 0:
			for btn in get_tree().get_nodes_in_group("level_button"):
				if btn.name == i:
#					print (ConfigManager._settings["level_stars"][i])
					for stars in ConfigManager._settings["level_stars"][i]:
						btn.get_node("StarsContainer").get_child(stars).modulate = Color("fff500")
						
func _on_BackButton_pressed():
	$"ButtonSFX".play()
	yield($"ButtonSFX", "finished")
	emit_signal("back")


func _on_Level1_pressed():
	$"ButtonSFX".play()
	yield($"ButtonSFX", "finished")
	var game = load("res://Scene/TheGame.tscn").instance()
	var map = "Level1"
	emit_signal("play", game, map)

func _on_Level2_pressed():
	$"ButtonSFX".play()
	yield($"ButtonSFX", "finished")
	var game = load("res://Scene/TheGame.tscn").instance()
	var map = "Level2"
	emit_signal("play", game, map)

func _on_Level3_pressed():
	$"ButtonSFX".play()
	yield($"ButtonSFX", "finished")
	var game = load("res://Scene/TheGame.tscn").instance()
	var map = "Level3"
	emit_signal("play", game, map)

func _on_Level4_pressed():
	$"ButtonSFX".play()
	yield($"ButtonSFX", "finished")
	var game = load("res://Scene/TheGame.tscn").instance()
	var map = "Level4"
	emit_signal("play", game, map)

func _on_Level5_pressed():
	$"ButtonSFX".play()
	yield($"ButtonSFX", "finished")
	var game = load("res://Scene/TheGame.tscn").instance()
	var map = "Level5"
	emit_signal("play", game, map)
