extends Area2D

@onready var label: Label = $Label

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		label.show()
		await get_tree().create_timer(8.0).timeout
		label.hide()
