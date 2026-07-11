extends Node

@onready var label: Label = $CanvasLayer/Label

var score:int = 500

func _process(_delta: float) -> void:
	label.text = "$: " + str(score) 

func add_points_1():
	score = 1500
	label.text = "$: " + str(score) 

func add_points_2():
	score *= 6
	label.text = "$: " + str(score) 

func diminish_points_1():
	score -= 275
	label.text = "$: " + str(score) 
