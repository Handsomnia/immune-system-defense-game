extends Control

signal level_selection
signal main_menu

func _on_ContinueButton_pressed():
	get_tree().paused = false
	queue_free()


func _on_OptionsButton_pressed():# $"./.." = UI
	var in_game_options = load("res://Scene/InGameOptions.tscn").instance()
	$"./..".add_child(in_game_options)


func _on_LevelSelectionButton_pressed():
	get_tree().paused = false
	emit_signal("level_selection")


func _on_MainMenuButton_pressed():
	get_tree().paused = false
	emit_signal("main_menu")
