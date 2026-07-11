extends CharacterBody2D

class_name AnaEnemy

@onready var animated_sprite = $AnimatedSprite2D

var exists = true
var player_in_area = false
var player_in_area_2 = false
var damage_to_deal_1: int = 30

func _process(_delta):
	if player_in_area == true:
		if Input.is_action_just_pressed("e"):
			run_dialouge("anaGiving")
	
	if player_in_area_2 == true:
		if Input.is_action_just_pressed("e"):
			deal_damage_to_player()
			run_dialouge("anaGiving_2")
	
	if exists == true:
		animated_sprite.play("idle")

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true

func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func run_dialouge(dialouge_string):
	Dialogic.start(dialouge_string)

func _on_chat_detection_2_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area_2 = true

func _on_chat_detection_2_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area_2 = false

func deal_damage_to_player():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.take_damage(damage_to_deal_1)
