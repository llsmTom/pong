extends CharacterBody2D

var speed = 300
var initial_vel: Vector2
var akcel: float = 1.033
var y_max: float

@onready var player: CharacterBody2D = %player
@onready var player_2: CharacterBody2D = %player2


func _ready() -> void:
	initial_vel = Vector2(randi_range(0, 1) * 2 - 1, randf_range(-1, 1))
	velocity = initial_vel * speed

func _draw() -> void:
	draw_circle(Vector2.ZERO, 10, Color.WHITE)
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider().name == "Boundary":
			velocity.y = -velocity.y
		elif collision.get_collider().name == "player":
			velocity.x = -velocity.x
			velocity.y += remap(player.global_position.y + GameManager.player_height[0] / 2 - global_position.y, -10, GameManager.player_height[0] + 10, -1, 1) * -speed / 2
			global_position.x = player.global_position.x + 25
			velocity *= akcel
		elif collision.get_collider().name == "player2":
			velocity.x = -velocity.x
			velocity.y += remap(player_2.global_position.y + GameManager.player_height[1] / 2 - global_position.y, -10, GameManager.player_height[1] + 10, -1, 1) * -speed / 2
			global_position.x = player_2.global_position.x - 25
			velocity *= akcel
	
	y_max = abs(velocity.x) * 1.5
	if velocity.y > y_max:
		velocity.y = y_max
	elif velocity.y < -y_max:
		velocity.y = -y_max
	
	print("Y max: ", y_max)
	print(velocity)
		
	
