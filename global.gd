extends Node2D


@onready var animated_sprite_2d: AnimatedSprite2D 


var Score: int
var player_position: Vector2 = Vector2.ZERO
var thunder_visible: bool = false
var music: bool = false


func thunder():
	thunder_visible = true
