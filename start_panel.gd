extends Control



func _on_start_pressed() -> void:
	Global.music = true
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_iesire_pressed() -> void:
	get_tree().quit()
