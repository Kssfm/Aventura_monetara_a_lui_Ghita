extends CharacterBody2D

class_name LicaEnemy

@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager: Node = %Game_manager

var exists:bool = true
var player_in_area = false
var player_in_area_2 = false
var damage_to_deal_1: int = 60
var points_for_job_1 = 900
var points_for_job_2 = 2000
var act_score: int = 100

func _ready():
	exists= true

func _process(_delta):
	Global.Score = act_score
	if player_in_area == true:
		if Input.is_action_just_pressed("e"):
			deal_damage_to_player()
			run_dialouge("licagiving")
	
	if player_in_area_2 == true:
		if Input.is_action_just_pressed("e"):
			#ddeal_damage_to_player()
			run_dialouge("licagiving_2")
	
	if exists == true:
		animated_sprite.play("idle")

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		game_manager.add_points_1()
		player_in_area = true

func deal_damage_to_player():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.take_damage(damage_to_deal_1)

func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func run_dialouge(dialouge_string):
	Dialogic.start(dialouge_string)

func _on_chat_detection_2_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		game_manager.add_points_2()
		player_in_area_2 = true

func _on_chat_detection_2_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area_2 = false
