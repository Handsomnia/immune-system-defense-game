extends Popup

enum DIALOG_SEQUENCE {PERTAMA, KEDUA, KETIGA, KEEMPAT,
					 KELIMA, KEENAM, KETUJUH, KEDELAPAN,
					KESEMBILAN, KESEPULUH, KESEBELAS}

var current_dialog
var dialog0 = "Halo, selamat datang di Sistem Imun Defense"
var dialog1 = "Saya akan menunjukkan bagaimana cara bermainnya"
var dialog2 = "Mari kita mulai!"

func _ready():
#	popup()
	$"DialogContainer/VBoxContainer/TutorialText".text = dialog0
	$"DialogContainer".visible = true
	$"BgHolder1/ColorRect".visible = true
	current_dialog = DIALOG_SEQUENCE.PERTAMA

func tutorial_state(state):
	if state == DIALOG_SEQUENCE.PERTAMA:
		$"DialogContainer/VBoxContainer/TutorialText".text = dialog1
		current_dialog = DIALOG_SEQUENCE.KEDUA
	if state == DIALOG_SEQUENCE.KEDUA:
		$"DialogContainer/VBoxContainer/TutorialText".text = dialog2
		current_dialog = DIALOG_SEQUENCE.KETIGA
	if state == DIALOG_SEQUENCE.KETIGA:
		$"DialogContainer/VBoxContainer/TutorialText".text = "HABIS"
		current_dialog = DIALOG_SEQUENCE.KEEMPAT
		$"DialogContainer".visible = false
		$BgHolder1/ColorRect.visible = false
		$BgHolder1/ColorRect2.visible = true
		$BuildBar.visible = true
		$"TowerInfoContainer".visible = true
		
		
	if state == DIALOG_SEQUENCE.KEEMPAT:
		current_dialog = DIALOG_SEQUENCE.KELIMA
		highlight_tower(1)
	if state == DIALOG_SEQUENCE.KELIMA:
		current_dialog = DIALOG_SEQUENCE.KEENAM
		highlight_tower(2)
	if state == DIALOG_SEQUENCE.KEENAM:
		current_dialog = DIALOG_SEQUENCE.KETUJUH
		highlight_tower(3)
	if state == DIALOG_SEQUENCE.KETUJUH:
		current_dialog = DIALOG_SEQUENCE.KEDELAPAN
		highlight_tower(4)
	if state == DIALOG_SEQUENCE.KEDELAPAN:
		$"BuildBar".visible = false
		$"TowerInfoContainer".visible = false
		$"TowerInfoContainer".visible = false
		current_dialog = DIALOG_SEQUENCE.KESEMBILAN
		$"MenempatkanTower".visible = true
	if state == DIALOG_SEQUENCE.KESEMBILAN:
		$"MenempatkanTower".visible = false
		current_dialog = DIALOG_SEQUENCE.KESEPULUH
		$"UpgradeAndSellTower".visible = true
	if state == DIALOG_SEQUENCE.KESEPULUH:
		$"UpgradeAndSellTower".visible = false
		current_dialog = DIALOG_SEQUENCE.KESEBELAS
		$"MenggeserKamera".visible = true
		$"MarginContainer/NextButton/Label".text = "Lanjutkan"
	if state == DIALOG_SEQUENCE.KESEBELAS:
		ConfigManager._settings["player"]["new_player"] = "false"
		ConfigManager.save_settings()
		queue_free()
	

func highlight_tower(tower_number):
	if tower_number == 1:
		$"TowerInfoContainer/TowerName".text = "Macrophage"
		$"TowerInfoContainer/Info1/Row2".text = "Kerusakan kecil"
		$"TowerInfoContainer/Info2/Row2".text =  "$ " + str(GameData.tower_data["Macrophage"]["cost"])
		$"TowerInfoContainer/Info3/Row2".text = "Target Area"
		for i in $"BuildBar".get_child_count():
			$"BuildBar".get_child(i).modulate = Color("00ffffff")
			if i == tower_number:
				$"BuildBar".get_child(tower_number).modulate = Color("ffffff")
	if tower_number == 2:
		$"TowerInfoContainer/TowerName".text = "Neutrophils"
		$"TowerInfoContainer/Info1/Row2".text = "Memberikan slow"
		$"TowerInfoContainer/Info2/Row2".text =  "$ " + str(GameData.tower_data["Neutrophils"]["cost"])
		$"TowerInfoContainer/Info3/Row2".text = "Target tunggal"
		for i in $"BuildBar".get_child_count():
			$"BuildBar".get_child(i).modulate = Color("00ffffff")
			if i == tower_number:
				$"BuildBar".get_child(tower_number).modulate = Color("ffffff")
	if tower_number == 3:
		$"TowerInfoContainer/TowerName".text = "TCell"
		$"TowerInfoContainer/Info1/Row2".text = "Damage Besar"
		$"TowerInfoContainer/Info2/Row2".text =  "$ " + str(GameData.tower_data["TCell"]["cost"])
		$"TowerInfoContainer/Info3/Row2".text = "Target tunggal"
		for i in $"BuildBar".get_child_count():
			$"BuildBar".get_child(i).modulate = Color("00ffffff")
			if i == tower_number:
				$"BuildBar".get_child(tower_number).modulate = Color("ffffff")
	if tower_number == 4:
		$"TowerInfoContainer/TowerName".text = "BCell"
		$"TowerInfoContainer/Info1/Row2".text = "Memproduksi Gold"
		$"TowerInfoContainer/Info2/Row2".text =  "$ " + str(GameData.tower_data["BCell"]["cost"])
		$"TowerInfoContainer/Info3/Row2".text = "-"
		for i in $"BuildBar".get_child_count():
			$"BuildBar".get_child(i).modulate = Color("00ffffff")
			if i == tower_number:
				$"BuildBar".get_child(tower_number).modulate = Color("ffffff")


func _on_NextButton_button_down():
	tutorial_state(current_dialog)
