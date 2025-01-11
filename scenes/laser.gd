extends Area2D

@export var speed = 750

func _ready():
	var tween = create_tween()
	tween.tween_property($LaserImage, 'scale', Vector2(1, 1), 0.2) \
	.from(Vector2(0.2, 0.2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= speed * delta
