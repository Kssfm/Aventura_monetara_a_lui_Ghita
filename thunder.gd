extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var triggered:bool = false

func _process(_delta: float) -> void:
	if Global.thunder_visible == true and !triggered:
		triggered = true
		var tree= get_tree()
		animated_sprite_2d.visible = true
		animated_sprite_2d.play("strike")
		await tree.create_timer(1.66).timeout
		tree.change_scene_to_file("res://scenes/final_panel.tscn")
