extends Node2D

@onready var player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	pass

func play_music():
	if not player.playing:
		player.play()

func stop_music():
	player.stop()
