extends Node

var tower_data = {
	"Complementary": {
		"name": "Complementary",
		"damage": 10,
		"rof": 1.5,
		"range": 64*3, # (64*2)*2 = 4 tiles far (2 tiles range)
		"category": "Projectile",
		"cost": 10.0,
		"cooldown": 1.0,
		"hp": 200 },
	"Macrophage": {
		"name": "Macrophage",
		"damage": 10,
		"rof": 1.5,
		"range": 64*3, # (64*2)*2 = 4 tiles far (2 tiles range)
		"category": "AOE",
		"cost": 24.0,
		"cooldown": 1.0,
		"hp": 200 },
	"Neutrophils": {
		"name": "Neutrophils",
		"damage": 8,
		"rof": 1,
		"range": 64*3,
		"category": "Slow",
		"effect_duration": 1.0, # detik
		"s_percentage": 30.0, # persentase slow
		"cost": 14.0,
		"cooldown": 1.0,
		"hp": 200 },
	"TCell": {
		"name": "TCell",
		"damage": 30,
		"rof": 1,
		"range": 64*6,
		"category": "Laser",
		"cost": 40.0,
		"cooldown": 1.0,
		"hp": 200 },
	"BCell": {
		"name": "BCell",
		"damage": 0.0,
		"rof": 10.0,
		"range": 0.0,
		"category": "Producer",
		"cost": 20.0,
		"cooldown": 1.0,
		"hp": 200 }
}

var wave_data = {
	"Level0":{
		"1":[
			["EColi",0.8, 95.0, 70.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 95.0, 70.0, 1]
			]
		},
#-------------- Level 1  Wave ----------------------------------------------
	"Level1":{
		"1":[
			["EColi",0.8, 20.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 20.0, 50.0, 1]
			],
		"2":[
			["EColi",0.8, 20.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 20.0, 50.0, 1],
			["EColi",0.8, 20.0, 50.0, 1],
			["EColi",0.8, 20.0, 50.0, 1],
			],
		"3":[
			["EColi",0.8, 30.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",1.0, 30.0, 50.0, 1],
			["Influenzavirus",1.0, 50.0, 40.0, 1]
			],
		"4":[
			["EColi",0.8, 30.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",1.0, 30.0, 50.0, 1],
			["Influenzavirus",0.8, 50.0, 40.0, 1],
			["Influenzavirus",0.8, 50.0, 40.0, 1]
			],
		"5":[
			["EColi",0.8, 35.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 35.0, 50.0, 1],
			["EColi",0.8, 35.0, 50.0, 1],
			["EColi",0.8, 35.0, 50.0, 1],
			["EColi",0.8, 35.0, 50.0, 1],
			["EColi",1.0, 35.0, 50.0, 1],
			["Influenzavirus",0.8, 55.0, 40.0, 1],
			["Influenzavirus",0.8, 55.0, 40.0, 1]
			],
		},
#-------------- End Of Level 1  Wave ----------------------------------------


#-------------- Level 2  Wave ----------------------------------------------
	"Level2":{
		"1":[
			["EColi",0.8, 20.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 20.0, 50.0, 1],
			["EColi",0.8, 20.0, 50.0, 1],
			["EColi",0.8, 20.0, 50.0, 1]
			],
		"2":[
			["EColi",0.8, 30.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1]
			],
		"3":[
			["EColi",0.8, 40.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 40.0, 50.0, 1],
			["EColi",0.8, 40.0, 50.0, 1],
			["EColi",0.8, 40.0, 50.0, 1],
			["EColi",0.8, 40.0, 50.0, 1],
			["EColi",1.0, 40.0, 50.0, 1],
			["Influenzavirus",0.8, 50.0, 40.0, 1],
			["Influenzavirus",0.8, 50.0, 40.0, 1]
			],
		"4":[
			["Coronavirus",0.6, 40.0, 55.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus",0.6, 40.0, 55.0, 1],
			["Coronavirus",0.6, 40.0, 55.0, 1],
			["Coronavirus",0.6, 40.0, 55.0, 1],
			["Coronavirus",0.6, 40.0, 55.0, 1],
			["Coronavirus",0.6, 40.0, 55.0, 1],
			["Coronavirus",0.6, 40.0, 55.0, 1],
			["Coronavirus",0.6, 40.0, 55.0, 1],
			["Coronavirus",1.0, 40.0, 55.0, 1],
			["Influenzavirus",0.8, 60.0, 40.0, 1],
			["Influenzavirus",0.8, 60.0, 40.0, 1]
			],
		"5":[
			["Salmonella",0.8, 40.0, 55.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Salmonella",0.8, 40.0, 55.0, 1],
			["Salmonella",0.8, 40.0, 55.0, 1],
			["Salmonella",0.8, 40.0, 55.0, 1],
			["Salmonella",0.8, 40.0, 55.0, 1],
			["Salmonella",1.0, 40.0, 55.0, 1],
			["Influenzavirus",0.8, 60.0, 45.0, 1],
			["Influenzavirus",0.8, 60.0, 45.0, 1]
			],
		"6":[
			["Coronavirus",0.6, 50.0, 60.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus",0.6, 50.0, 60.0, 1],
			["Coronavirus",0.6, 50.0, 60.0, 1],
			["Coronavirus",0.6, 50.0, 60.0, 1],
			["Coronavirus",0.6, 50.0, 60.0, 1],
			["Coronavirus",0.6, 50.0, 60.0, 1],
			["Coronavirus",0.6, 50.0, 60.0, 1],
			["Salmonella",0.8, 50.0, 80.0, 1],
			["Salmonella",0.8, 50.0, 80.0, 1],
			["Salmonella",0.8, 50.0, 80.0, 1],
			["Salmonella",0.8, 50.0, 80.0, 1],
			["Salmonella",1.0, 50.0, 80.0, 1],
			["Influenzavirus",0.8, 80.0, 45.0, 1],
			["Influenzavirus",0.8, 80.0, 45.0, 1],
			["Influenzavirus",0.8, 80.0, 45.0, 1],
			["Influenzavirus",0.8, 80.0, 45.0, 1]
			],
		"7":[
			["Salmonella",0.8, 60.0, 80.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",0.8, 60.0, 80.0, 1],
			["Salmonella",1.0, 60.0, 80.0, 1],
			["Influenzavirus",0.8, 80.0, 45.0, 1],
			["Influenzavirus",0.8, 80.0, 45.0, 1],
			["Influenzavirus",0.8, 80.0, 45.0, 1],
			["Influenzavirus",0.8, 80.0, 45.0, 1]
			],
		},
#-------------- End Of Level 2  Wave ---------------------------------------


#-------------- Level 3  Wave ----------------------------------------------

	"Level3":{
		"1":[
			["EColi",0.8, 30.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1]
			],
		"2":[
			["EColi",0.8, 40.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 40.0, 50.0, 1],
			["EColi",0.8, 40.0, 50.0, 1],
			["EColi",0.8, 40.0, 50.0, 1],
			["EColi",0.8, 40.0, 50.0, 1]
			],
		"3":[
			["EColi",0.8, 40.0, 50.0, 2], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2],
			],
		"4":[
			["Coronavirus",0.6, 50.0, 50.0, 2], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus",0.6, 50.0, 50.0, 2],
			["Coronavirus",0.6, 50.0, 50.0, 2],
			["Coronavirus",0.6, 50.0, 50.0, 2],
			["Coronavirus",0.6, 50.0, 50.0, 2],
			],
		"5":[
			["Coronavirus", 0.1, 60.0, 55.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus", 0.6, 60.0, 55.0, 2],
			["Coronavirus", 0.1, 60.0, 55.0, 1],
			["Coronavirus", 0.6, 60.0, 55.0, 2],
			["Coronavirus", 0.1, 60.0, 55.0, 1],
			["Coronavirus", 0.6, 60.0, 55.0, 2],
			["Coronavirus", 0.1, 60.0, 55.0, 1],
			["Coronavirus", 0.6, 60.0, 55.0, 2],
			["Coronavirus", 0.1, 60.0, 55.0, 1],
			["Coronavirus", 0.6, 60.0, 55.0, 2]
			],
		"6":[
			["Coronavirus",0.1, 70.0, 55.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus",0.6, 70.0, 55.0, 2],
			["Coronavirus",0.1, 70.0, 55.0, 1],
			["Coronavirus",0.6, 70.0, 55.0, 2],
			["Coronavirus",0.1, 70.0, 55.0, 1],
			["Coronavirus",0.6, 70.0, 55.0, 2],
			["Coronavirus",0.1, 70.0, 55.0, 1],
			["Salmonella",0.8, 75.0, 75.0, 2],
			["Salmonella",0.1, 75.0, 75.0, 1],
			["Salmonella",0.8, 75.0, 75.0, 2],
			["Salmonella",0.1, 75.0, 75.0, 1],
			["Salmonella",1.0, 75.0, 75.0, 2],
			["Influenzavirus",0.1, 90.0, 50.0, 1],
			["Influenzavirus",0.8, 90.0, 50.0, 2]
			],
		"7":[
			["Salmonella",0.1, 80.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",1.0, 80.0, 75.0, 1],
			["Influenzavirus",0.8, 90.0, 50.0, 2],
			["Influenzavirus",0.1, 90.0, 50.0, 1],
			["Influenzavirus",0.8, 90.0, 50.0, 2],
			["Influenzavirus",0.8, 90.0, 50.0, 1]
			],
		"8":[
			["Salmonella",0.1, 80.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Influenzavirus",0.1, 90.0, 55.0, 1],
			["Influenzavirus",0.8, 90.0, 55.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Salmonella",0.1, 80.0, 75.0, 1],
			["Salmonella",0.8, 80.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2]
			],
		"9":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 850, 75.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2]
			],
		"10":[
			["Rhinovirus",3.0, 300.0, 30.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Rhinovirus",1.2, 300.0, 30.0, 2]
			],
		"11":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2]
			],
		"12":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2],
			["Influenzavirus",0.1, 95.0, 55.0, 1],
			["Influenzavirus",0.8, 95.0, 55.0, 2]
			]
		},
#-------------- End Of Level 3  Wave ---------------------------------------


#-------------- Level 4  Wave ----------------------------------------------
	"Level4":{
		"1":[
			["EColi",0.8, 30.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1]
			],
		"2":[
			["EColi",0.8, 40.0, 50.0, 2], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2],
			],
		"3":[
			["EColi",0.8, 60.0, 65.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 60.0, 65.0, 2],
			["EColi",0.8, 60.0, 65.0, 1],
			["EColi",0.8, 60.0, 65.0, 2],
			["EColi",0.8, 60.0, 65.0, 1],
			["EColi",1.0, 60.0, 65.0, 2],
			["Influenzavirus",0.1, 90.0, 50.0, 1],
			["Influenzavirus",0.8, 90.0, 50.0, 2]
			],
		"4":[
			["Coronavirus",0.1, 70.0, 60.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus",0.6, 70.0, 60.0, 2],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Coronavirus",0.6, 70.0, 60.0, 2],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Coronavirus",0.6, 70.0, 60.0, 2],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Coronavirus",0.6, 70.0, 60.0, 2],
			["Coronavirus",1.0, 70.0, 60.0, 1],
			["Influenzavirus",0.1, 90.0, 55.0, 1],
			["Influenzavirus",0.8, 90.0, 55.0, 2]
			],
		"5":[
			["Salmonella",0.1, 80.0, 70.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Salmonella",0.8, 80.0, 70, 2],
			["Salmonella",0.1, 80.0, 70.0, 1],
			["Salmonella",0.8, 80.0, 70.0, 2],
			["Salmonella",0.1, 80.0, 70.0, 1],
			["Salmonella",1.0, 80.0, 70.0, 2],
			["Influenzavirus",0.8, 90.0, 55.0, 2],
			["Influenzavirus",0.8, 90.0, 55.0, 2]
			],
		"6":[
			["Coronavirus",0.1, 70.0, 60.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus",0.6, 70.0, 60.0, 2],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Coronavirus",0.6, 70.0, 60.0, 2],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Coronavirus",0.6, 70.0, 60.0, 2],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",1.0, 85.0, 70.0, 2],
			["Influenzavirus",0.1, 90.0, 60.0, 1],
			["Influenzavirus",0.8, 90.0, 60.0, 2],
			["Influenzavirus",0.1, 90.0, 60.0, 1],
			["Influenzavirus",0.8, 90.0, 60.0, 2]
			],
		"7":[
			["Salmonella",0.1, 85.0, 70.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",1.0, 85.0, 70.0, 1],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2]
			],
		"8":[
			["Salmonella",0.8, 90.0, 70.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 90.0, 70.0, 2],
			["Salmonella",0.8, 90.0, 70.0, 1],
			["Salmonella",0.8, 90.0, 70.0, 2],
			["Salmonella",0.8, 90.0, 70.0, 1],
			["Salmonella",0.8, 90.0, 70.0, 2],
			["Salmonella",0.8, 90.0, 70.0, 1],
			["Salmonella",0.8, 90.0, 70.0, 2],
			["Influenzavirus",0.8, 155.0, 80.0, 1],
			["Influenzavirus",0.8, 155.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.8, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.8, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.8, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Influenzavirus",0.8, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2]
			],
		"9":[
			["Salmonella",0.1, 85.0, 70.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.8, 95.0, 60.0, 1],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.8, 95.0, 60.0, 1]
			],
		"10":[
			["Rhinovirus",1.2, 500.0, 30.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Rhinovirus",1.2, 500.0, 30.0, 2]
			],
		"11":[
			["Salmonella",0.1, 85.0, 70.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2]
			],
		"12":[
			["Salmonella",0.1, 85.0, 70.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Salmonella",0.1, 85.0, 70.0, 1],
			["Salmonella",0.8, 85.0, 70.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2]
			],
		"13":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2]
			],
		"14":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2]
			],
		"15":[
			["Rhinovirus",0.1, 500.0, 30.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Rhinovirus",1.2, 500.0, 30.0, 2],
			["Rhinovirus",0.1, 500.0, 30.0, 1],
			["Rhinovirus",1.2, 500.0, 30.0, 2]
			],
		"16":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2]
			],
		"17":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2],
			["Influenzavirus",0.1, 95.0, 60.0, 1],
			["Influenzavirus",0.8, 95.0, 60.0, 2]
			],
		},
#-------------- End Of Level 4  Wave ---------------------------------------


#-------------- Level 5  Wave ----------------------------------------------
	"Level5":{
		"1":[
			["EColi",0.8, 30.0, 50.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1],
			["EColi",0.8, 30.0, 50.0, 1]
			],
		"2":[
			["EColi",0.8, 40.0, 50.0, 2], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2],
			["EColi",0.8, 40.0, 50.0, 2]
			],
		"3":[
			["EColi",0.8, 50.0, 50.0, 3], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["EColi",0.8, 50.0, 50.0, 3],
			["EColi",0.8, 50.0, 50.0, 3],
			["EColi",0.8, 50.0, 50.0, 3],
			["EColi",0.8, 50.0, 50.0, 3],
			],
		"4":[
			["Coronavirus",0.1, 70.0, 60.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus",0.1, 70.0, 60.0, 2],
			["Coronavirus",0.6, 70.0, 60.0, 3],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Coronavirus",0.1, 70.0, 60.0, 2],
			["Coronavirus",0.6, 70.0, 60.0, 3],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Coronavirus",0.1, 70.0, 60.0, 2],
			["Coronavirus",1.0, 70.0, 60.0, 3],
			["Influenzavirus",0.1, 90.0, 55.0, 1],
			["Influenzavirus",0.8, 90.0, 55.0, 2]
			],
		"5":[
			["Salmonella",0.1, 80.0, 70.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Salmonella",0.1, 80.0, 70.0, 2],
			["Salmonella",0.8, 80.0, 70.0, 3],
			["Salmonella",0.1, 80.0, 70.0, 1],
			["Salmonella",0.1, 80.0, 70.0, 2],
			["Salmonella",1.0, 80.0, 70.0, 3],
			["Influenzavirus",0.8, 90.0, 55.0, 2],
			["Influenzavirus",0.8, 90.0, 55.0, 2]
			],
		"6":[
			["Coronavirus",0.1, 70.0, 60.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Coronavirus",0.1, 70.0, 60.0, 2],
			["Coronavirus",0.6, 70.0, 60.0, 3],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Coronavirus",0.1, 70.0, 60.0, 2],
			["Coronavirus",0.6, 70.0, 60.0, 3],
			["Coronavirus",0.1, 70.0, 60.0, 1],
			["Salmonella",0.1, 80.0, 70.0, 2],
			["Salmonella",0.8, 80.0, 70.0, 3],
			["Salmonella",0.1, 80.0, 70.0, 1],
			["Salmonella",0.1, 80.0, 70.0, 2],
			["Salmonella",1.0, 80.0, 70.0, 3],
			["Influenzavirus",0.1, 90.0, 55.0, 1],
			["Influenzavirus",0.1, 90.0, 55.0, 2],
			["Influenzavirus",0.8, 90.0, 55.0, 3],
			["Influenzavirus",0.8, 90.0, 55.0, 1]
			],
		"7":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",1.0, 85.0, 75.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.8, 100.0, 55.0, 2]
			],
		"8":[
			["Salmonella",0.8, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Influenzavirus",0.8, 100.0, 55.0, 1],
			["Influenzavirus",0.8, 100.0, 55.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Salmonella",0.8, 85.0, 75.0, 1],
			["Influenzavirus",0.8, 100.0, 55.0, 1],
			["Influenzavirus",0.8, 100.0, 55.0, 1]
			],
		"9":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.8, 100.0, 55.0, 1]
			],
		"10":[
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Rhinovirus",0.1, 400.0, 30.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Rhinovirus",1.2, 400.0, 30.0, 2]
			],
		"11":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.8, 100.0, 55.0, 1]
			],
		"12":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3]
			],
		"13":[
			["Salmonella",0.1, 85.0, 75.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Salmonella",0.1, 85.0, 75.0, 2],
			["Salmonella",0.8, 85.0, 75.0, 3],
			["Salmonella",0.1, 85.0, 75.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.8, 100.0, 55.0, 1]
			],
		"14":[
			["Salmonella",0.1, 85.0, 80.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3]
			],
		"15":[
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",1.2, 100.0, 55.0, 3],
			["Rhinovirus", 0.1, 400.0, 30.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Rhinovirus",0.1, 400.0, 30.0, 2],
			["Rhinovirus",1.2, 400.0, 30.0, 3]
			],
		"16":[
			["Salmonella",0.1, 85.0, 80.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Influenzavirus",0.1, 100.0, 55.0, 2],
			["Influenzavirus",0.8, 100.0, 55.0, 3],
			["Influenzavirus",0.1, 100.0, 55.0, 1]
			],
		"17":[
			["Salmonella",0.1, 85.0, 80.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3],
			["Influenzavirus",0.1, 100.0, 60.0, 1],
			["Influenzavirus",0.1, 100.0, 60.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3],
			["Influenzavirus",0.1, 100.0, 60.0, 1],
			["Influenzavirus",0.1, 100.0, 60.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3]
			],
		"18":[
			["Salmonella",0.1, 85.0, 80.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3],
			["Influenzavirus",0.1, 100.0, 60.0, 1],
			["Influenzavirus",0.1, 100.0, 60.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Influenzavirus",0.1, 100.0, 60.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3],
			["Influenzavirus",0.8, 100.0, 60.0, 1]
			],
		"19":[
			["Salmonella",0.1, 85.0, 80.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3],
			["Influenzavirus",0.1, 100.0, 60.0, 1],
			["Influenzavirus",0.1, 100.0, 60.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Salmonella",0.8, 85.0, 80.0, 3],
			["Salmonella",0.1, 85.0, 80.0, 1],
			["Salmonella",0.1, 85.0, 80.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3],
			["Influenzavirus",0.1, 100.0, 60.0, 1],
			["Influenzavirus",0.1, 100.0, 60.0, 2],
			["Influenzavirus",0.8, 100.0, 60.0, 3]
			],
		"20":[
			["Rhinovirus",0.1, 500.0, 30.0, 1], # [name, next_spawn_time, hp,
											# movement_speed, track]

			["Rhinovirus",0.1, 500.0, 30.0, 2],
			["Rhinovirus",1.2, 500.0, 30.0, 3],
			["Rhinovirus",0.1, 500.0, 30.0, 1],
			["Rhinovirus",0.1, 500.0, 30.0, 2],
			["Rhinovirus",1.2, 500.0, 30.0, 3]
			],
		}
#	"1":[
#		["Influenzavirus",10.0, 95.0], # [name, next_spawn_time, hp]
#		["Influenzavirus",10.0, 95.0],
#		["Influenzavirus",10.0, 95.0],
#		["Influenzavirus",4.0, 200.0],
#		["Influenzavirus",4.0, 200.0]
#		],
#	"2":[
#		["Influenzavirus",1.0, 200.0], 
#		["EColi",1.0, 200.0],
#		["Coronavirus",1.0, 200.0],
#		["Coronavirus",1.0, 300.0],
#		["EColi",1.0, 300.0],
#		["Rhinovirus",1.0, 300.0],
#		["EColi",1.0, 350.0],
#		["Rhinovirus",1.0, 350.0],
#		["Influenzavirus",1.0, 350.0],
#		["Influenzavirus",1.0, 500.0]
#		]
}





























