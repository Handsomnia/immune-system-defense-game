extends Control



#func _on_Play_button_up():
#	$"PlayButtonSFX".play()
func _ready():
	ConfigManager.load_settings()
	$"ButtonSFX".volume_db = ConfigManager._settings["audio"]["sfx_volume"]

func _on_Play_pressed():
	$"ButtonSFX".play()

func _on_Options_pressed():
	$"ButtonSFX".play()

func _on_Exit_pressed():
	$"ButtonSFX".play()
