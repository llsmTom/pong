extends Label

@onready var label: Label = $"."

@export var player_num: int = 0

func _ready() -> void:
	label.text = str(GameManager.score[player_num])

func _process(delta: float) -> void:
	label.text = str(GameManager.score[player_num])
