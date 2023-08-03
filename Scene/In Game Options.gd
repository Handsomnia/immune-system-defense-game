extends Control

var music_volume
var sfx_volume
var setting_is_changed = false

func _ready():
	ConfigManager.load_settings()
	$"VBoxContainer/TabContainer/Settings/VBoxContainer/MusicSlider".value = ConfigManager._settings["audio"]["music_volume"]
	$"VBoxContainer/TabContainer/Settings/VBoxContainer/SFXSlider".value = ConfigManager._settings["audio"]["sfx_volume"]

func _on_Button_pressed():
	$"ButtonSFX".play()
	yield(get_node("ButtonSFX"), "finished")
	if setting_is_changed == true:
		queue_free()
	else:
		setting_changed(false)
		queue_free()

#ignore-warning

func get_music_setting():
	var music_slider = get_node("VBoxContainer/TabContainer/Settings/VBoxContainer/MusicSlider")
	return music_slider.value

func get_sfx_setting():
	var sfx_slider = get_node("VBoxContainer/TabContainer/Settings/VBoxContainer/SFXSlider")
	return sfx_slider.value

func setting_changed(confirm):
	if confirm == true:
		music_volume = get_music_setting()
		sfx_volume = get_sfx_setting()
		if music_volume <= -20.0:
			ConfigManager._settings["audio"]["music_volume"] = -80.0
			ConfigManager.save_settings()
			get_tree().call_group("music", "set_volume_db", ConfigManager._settings["audio"]["music_volume"])
		if music_volume > -20.0:
			ConfigManager._settings["audio"]["music_volume"] = music_volume
			ConfigManager.save_settings()
			get_tree().call_group("music", "set_volume_db", ConfigManager._settings["audio"]["music_volume"])
		if sfx_volume <= -20.0:
			ConfigManager._settings["audio"]["sfx_volume"] = -80.0
			ConfigManager.save_settings()
			get_tree().call_group("sfx", "set_volume_db", ConfigManager._settings["audio"]["sfx_volume"])
		if sfx_volume > -20.0:
			ConfigManager._settings["audio"]["sfx_volume"] = sfx_volume
			ConfigManager.save_settings()
			get_tree().call_group("sfx", "set_volume_db", ConfigManager._settings["audio"]["sfx_volume"])
	else:
		ConfigManager.load_settings()
		get_tree().call_group("music", "set_volume_db", ConfigManager._settings["audio"]["music_volume"])
		get_tree().call_group("music", "set_volume_db", ConfigManager._settings["audio"]["sfx_volume"])

func _on_SaveSettingsButton_pressed():
	setting_is_changed = true
	setting_changed(setting_is_changed)

func _on_MusicSlider_value_changed(value):
	if value <= -20.0:
		get_tree().call_group("music", "set_volume_db", -80.0)
	if value > -20.0:
		get_tree().call_group("music", "set_volume_db", value)
	setting_is_changed = false


func _on_EffectSlider_value_changed(value):
	if value <= -20.0:
		get_tree().call_group("sfx", "set_volume_db", -80.0)
	if value > -20.0:
		get_tree().call_group("sfx", "set_volume_db", value)
	setting_is_changed = false















