extends ColorRect


@onready var label_1: Label = $VBoxContainer/Label1
@onready var label_2: Label = $VBoxContainer/Label2
@onready var label_3: Label = $Label3

func _process(delta: float) -> void:
	await get_tree().create_timer(6.0).timeout
	label_1.visible = false
	label_2.visible = true
	await get_tree().create_timer(4.5).timeout
	label_2.visible = false
	label_3.visible = true
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/final_exit.tscn")
