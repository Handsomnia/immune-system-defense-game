extends Node

signal skip

enum PHASE{SATU, DUA, TIGA, EMPAT, LIMA, TERAKHIR}

onready var tween = get_node("Tween")

var text1 = "Disuatu hari yang normal ..."
var text2 = "Namun dalam dunia kecil yang tak terlihat ..."
var text3 = "Akan tetapi ..."
var text4 = "Saat berada didalam tubuh, sistem imun tidak membiarkan mereka begitu saja."
var image1 = load("res://Assets/Image/busy_city_png.png")
var image2 = load("res://Assets/Image/busy_city_with_pahtogen_png.png")

var fase

func _ready():
	fase = PHASE.SATU
	$"Control/VBoxContainer/MarginContainer/Button/Label".text = "Next >>"
	$"Control/VBoxContainer/CenterContainer/Label".text = text1

#func transition(_from, _to):
#	print("hai")

func _on_Button_pressed():
	if fase == PHASE.SATU:
		tween.interpolate_property($"Control/VBoxContainer/CenterContainer/Label", "modulate", Color("ffff"), Color("0000"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
		
		$"Control/VBoxContainer/MarginContainer/Button".disabled = true
		yield(tween, "tween_completed")
		$"Control/VBoxContainer/MarginContainer/Button".disabled = false
		
		$"Control/ImageContainer".modulate = Color("0000")
		$"Control/ImageContainer".visible = true
		$"Control/ImageContainer/TextureRect".texture = image1
		$"Control/VBoxContainer/CenterContainer/Label".text = ""
		tween.interpolate_property($"Control/ImageContainer", "modulate", Color("0000"), Color("ffff"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		fase = PHASE.DUA
	elif fase == PHASE.DUA:
		tween.interpolate_property($"Control/ImageContainer", "modulate", Color("ffff"), Color("0000"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
		
		$"Control/VBoxContainer/MarginContainer/Button".disabled = true
		yield(tween, "tween_completed")
		$"Control/VBoxContainer/MarginContainer/Button".disabled = false
		
		$"Control/ImageContainer".visible = false
		$"Control/VBoxContainer/CenterContainer/Label".text = text2
		tween.interpolate_property($"Control/VBoxContainer/CenterContainer/Label", "modulate", Color("0000"), Color("ffff"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		fase = PHASE.TIGA
	elif fase == PHASE.TIGA:
		$"Control/ImageContainer".visible = true
		$"Control/ImageContainer/TextureRect".texture = image2
		$"Control/VBoxContainer/CenterContainer/Label".text = ""
		tween.interpolate_property($"Control/ImageContainer", "modulate", Color("0000"), Color("ffff"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
		
		$"Control/VBoxContainer/MarginContainer/Button".disabled = true
		yield(tween, "tween_completed")
		$"Control/VBoxContainer/MarginContainer/Button".disabled = false
		fase = PHASE.EMPAT
	elif fase == PHASE.EMPAT:
		tween.interpolate_property($"Control/ImageContainer", "modulate", Color("ffff"), Color("0000"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
		yield(tween, "tween_completed")
		$"Control/VBoxContainer/CenterContainer/Label".modulate = Color("0000")
		$"Control/VBoxContainer/CenterContainer/Label".text = text3
		tween.interpolate_property($"Control/VBoxContainer/CenterContainer/Label", "modulate", Color("0000"), Color("ffff"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		
		$"Control/ImageContainer".visible = false
		
		$"Control/VBoxContainer/MarginContainer/Button".disabled = true
		yield(tween, "tween_completed")
		$"Control/VBoxContainer/MarginContainer/Button".disabled = false
		
		fase = PHASE.LIMA
	elif fase == PHASE.LIMA:
		tween.interpolate_property($"Control/VBoxContainer/CenterContainer/Label", "modulate", Color("ffff"), Color("0000"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
		yield(tween, "tween_completed")
		
		$"Control/VBoxContainer/CenterContainer/Label".text = text4
		tween.interpolate_property($"Control/VBoxContainer/CenterContainer/Label", "modulate", Color("0000"), Color("ffff"), 1.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		
		$"Control/VBoxContainer/MarginContainer/Button".disabled = true
		yield(tween, "tween_completed")
		$"Control/VBoxContainer/MarginContainer/Button".disabled = false
		
		fase = PHASE.TERAKHIR
	elif fase == PHASE.TERAKHIR:
		fase = null
		var game = load("res://Scene/TheGame.tscn").instance()
		var level = "Level1"
		
		tween.interpolate_property($"Control/VBoxContainer/CenterContainer/Label", "modulate", Color("ffff"), Color("0000"), 2.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
		yield(tween, "tween_completed")
		
		emit_signal("skip", game, level)
		queue_free()
