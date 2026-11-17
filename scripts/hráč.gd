extends CharacterBody2D

@export var UP: String = "up_1"
@export var DOWN: String = "down_1"
@export var player_num: int = 0
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var color_rect: ColorRect = $ColorRect
@onready var top: CollisionShape2D = %Top
@onready var bottom: CollisionShape2D = %Bottom

var player_height = GameManager.player_height[player_num]
var VELOCITY = 200
var target: float = 0
func _ready() -> void:
	collision_shape.shape.size.y = player_height
	color_rect.size.y = player_height

func _draw() -> void:
	var offset_y = target - global_position.y
	
	var rect = Rect2(color_rect.position + Vector2(0, offset_y), color_rect.size)
	
	draw_rect(rect, Color(1, 1, 1, 0.4), false, 2.0)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed(UP):
		target -= 400 * delta
	if Input.is_action_pressed(DOWN):
		target += 400 * delta
	
	global_position.y = move_toward(global_position.y, target, VELOCITY * delta / 100)
		
	if position.y < target:
		velocity.y = VELOCITY
	elif position.y > target:
		velocity.y = -VELOCITY

	velocity.x = 0
	move_and_slide()
