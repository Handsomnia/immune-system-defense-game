extends Control

signal next_level
signal main_menu
signal level_selection


func _on_NextLevelButton_pressed():
	emit_signal("next_level")


func _on_MainMenuButton_pressed():
	emit_signal("main_menu")


func _on_LevelSelectionButton_pressed():
	emit_signal("level_selection")
