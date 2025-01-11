extends Area2D

var speed: int
var rot_speed: float
var direction_x: float
var direction_y: float

func _ready():
	var rng := RandomNumberGenerator.new()
	
	# texture
	var colors = ["Brown", "Grey"]
	var path: String = "res://kenney_space-shooter-redux/PNG/Meteors/meteor" \
	+ colors[rng.randi_range(0,1)] \
	+ "_big" + str(rng.randi_range(1,4)) + ".png"
	$MeteorImage.texture = load(path)
	
	# atts
	speed = rng.randi_range(250, 550)
	rot_speed = rng.randf_range(-1.0, 1.0)
	direction_x = rng.randf_range(-1.0, 1.0)
	direction_y = rng.randf_range(0.5, 1.0)	
	
	# start pos
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
func _process(delta: float) -> void:
	position += Vector2(direction_x, direction_y) * speed * delta
	rotation += rot_speed * delta

func _on_body_entered(_body: Node2D) -> void:
	print('boom')
