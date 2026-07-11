extends Area2D


var player_in_area: bool
var damage_to_deal_1 = 100

func _process(_delta: float) -> void:
	if player_in_area == true:
		if Input.is_action_just_pressed("e"):
			deal_damage_to_player()
			run_dialouge("lica_anagiving")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false

func run_dialouge(dialouge_string):
	Dialogic.start(dialouge_string)
	

func deal_damage_to_player():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.take_damage(damage_to_deal_1)
