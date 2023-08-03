extends Node

# ------- Android Save path
const SAVE_PATH = "user://config.ini"

# ------- PC Save path
#const SAVE_PATH = "res://config.ini"

var music_volume = 0.0
var sfx_volume = 0.0

var _config_file = ConfigFile.new()
var _settings = {
	"player": {
		"new_player": "true"
	},
	"audio": {
#		"mute": Globals.get("Settings/mute"),
		"music_volume": 0.0,
		"sfx_volume": 0.0
	},
	"level":{
		"Level1": "unlocked",
		"Level2": "locked",
		"Level3": "locked",
		"Level4": "locked",
		"Level5": "locked"
	},
	"level_stars":{
		"Level1": 0,
		"Level2": 0,
		"Level3": 0,
		"Level4": 0,
		"Level5": 0
	}
}

#func _ready():
#	save_settings()
#	load_settings()

func save_settings():
	for section in _settings.keys():
		for key in _settings[section]:
			_config_file.set_value(section, key, _settings[section][key])
	
	_config_file.save(SAVE_PATH)

func load_settings():
	var err = _config_file.load(SAVE_PATH)
	if err != OK:
		print ("failed return settings, error code %s " % err)
		return []
	
	for section in _settings.keys():
		for key in _settings[section]:
			_settings[section][key] = _config_file.get_value(section, key, null)
			
























