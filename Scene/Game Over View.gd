extends Control

signal main_menu
signal retry
signal level_selection

func _on_MainMenuButton_pressed():
	get_tree().paused = false
	emit_signal("main_menu")


func _on_RetryButton_pressed():
#	print(get_parent().get_parent())
	get_tree().paused = false
	emit_signal("retry")


func _on_LevelSelectionButton_pressed():
	get_tree().paused = false
	emit_signal("level_selection")
