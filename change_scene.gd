extends Area2D

var psiho_ready:bool
var restore_damage = 90

@onready var change_scene: Area2D = $"."

const TARGET_SCENE_PATH_PSIHO = "res://scenes/psiholog.tscn"
const TARGET_SCENE_PATH_GAME = "res://scenes/game.tscn"

func _process(_delta: float) -> void:
	if psiho_ready == true:
		if Input.is_action_just_pressed("e"):
			restore_damage_to_player()
			var player = get_tree().get_first_node_in_group("player")
			if player:
				Global.player_position = player.global_position
			get_tree().change_scene_to_file("res://scenes/psiholog.tscn")
			change_scene.monitoring = false

func restore_damage_to_player():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.restore_damage(restore_damage)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		psiho_ready = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		psiho_ready = false
