extends Node


func _ready():
	ConfigManager.save_settings()
	ConfigManager.load_settings()
	$"gameMusic".volume_db = ConfigManager._settings["audio"]["music_volume"]
	load_main_menu()

func load_main_menu():
	#warning-ignore:return_value_discarded
	get_node('MainMenu/Margin/ButtonContainer/Play').connect("pressed", self, "load_level_selection")
	#warning-ignore:return_value_discarded
	get_node('MainMenu/Margin/ButtonContainer/Options').connect("pressed", self, "on_options_pressed")
	#warning-ignore:return_value_discarded
	get_node('MainMenu/Margin/ButtonContainer/Exit').connect("pressed", self, "_on_exit_pressed")

func load_level_selection():
	if self.has_node("MainMenu"):
		yield(get_node('MainMenu/ButtonSFX'), "finished")
		get_node('MainMenu').queue_free()
	if ConfigManager._settings["player"]["new_player"] == "true":
		load_cutscene()
	else:
		var level_selection_view = load("res://Scene/Level Selection.tscn").instance()
		level_selection_view.connect("play", self, "load_game")
		level_selection_view.connect("back", self, "unload_level_selection")
		add_child(level_selection_view)

func load_cutscene():
	var cutscene = load("res://Scene/Cutscenes/NewGameCutscene.tscn").instance()
#	cutscene.connect("skip", self, "load_tutorial")
	cutscene.connect("skip", self, "load_game")
	add_child(cutscene)
#	ConfigManager._settings["player"]["new_player"] = "true"  #------------------------------------------------------------------------
	
	

func on_options_pressed():
#	yield(get_tree().create_timer(0.1), "timeout")
	yield(get_node('MainMenu/ButtonSFX'), "finished")
	get_node("MainMenu").queue_free()
	var options_view = load("res://Scene/Options.tscn").instance()
	options_view.connect("back", self, "unload_options")
	add_child(options_view)


func _on_exit_pressed():
#	yield(get_tree().create_timer(0.1), "timeout")
	yield(get_node('MainMenu/ButtonSFX'), "finished")
	get_tree().quit()



func load_game(_game, map):
	var game = _game
	
	if self.has_node("Level Selection"):
		get_node("Level Selection").queue_free()
	if self.has_node("NewGameCutscene"):
		get_node("NewGameCutscene").queue_free()
#	if self.has_node("TheGame"):
#		get_node("TheGame").queue_free()
	game.connect("game_finished", self, "game_finish")
	game.connect("retry", self, "retry_level")
	game.map = map
	game.name = "TheGame"
	add_child(game)
	
	

## ----- unload

func retry_level(level_res, map_res):
#	if has_node("TheGame"):
	get_node("TheGame").queue_free()
	$AnimationPlayer.play("fading")
	yield(get_tree().create_timer(0.5), "timeout")
#	remove_child(get_child(0))
	var level = load(level_res).instance()
	load_game(level, map_res)
	

func game_finish(_result):
#	print(result)
#	get_node("TheGame").queue_free()
	get_node("TheGame").queue_free()
	if _result == "levels":
		load_level_selection()
	else:
		var main_menu = load("res://Scene/MainMenu.tscn").instance()
		add_child(main_menu)
		load_main_menu()

func unload_level_selection():
	get_node("Level Selection").queue_free()
	var main_menu = load("res://Scene/MainMenu.tscn").instance()
	add_child(main_menu)
	load_main_menu()

func unload_options():
	get_node("Options").queue_free()
	var main_menu = load("res://Scene/MainMenu.tscn").instance()
	add_child(main_menu)
	load_main_menu()























