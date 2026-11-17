extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		GameManager.score[1] += 1
		print(GameManager.score)
		get_tree().call_deferred("reload_current_scene")
