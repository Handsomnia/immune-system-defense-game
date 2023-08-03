extends Node2D


func _ready():
	if self.name == "Level1" and ConfigManager._settings["player"]["new_player"] == "true":
		var tutorial_dialog = load("res://Scene/Dialog/TutorialDialog.tscn").instance()
		$"../UI/HUD".add_child(tutorial_dialog)
		$"../UI/HUD/TutorialDialog".popup()

func _on_Map2_tree_entered():
#	print ("im here")
	var placings = get_node("Placings").get_children()#.size()
	for i in placings.size():
		placings[i].emit_signal("mouse_entered")
		placings[i].emit_signal("mouse_exited")
#	print (placings)
