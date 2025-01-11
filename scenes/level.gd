extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _ready():
	# stars
	var rng := RandomNumberGenerator.new()
	var size := get_viewport().get_visible_rect().size
	for star in $Stars.get_children():
		# position
		var random_x = rng.randi_range(25, int(size.x) - 25)
		var random_y = rng.randi_range(25, int(size.y) - 25)
		star.position = Vector2(random_x, random_y)
		
		# scale
		var random_scale = rng.randf_range(0.5, 2.0)
		star.scale = Vector2(random_scale, random_scale)
		
		# animation_speed
		star.speed_scale = rng.randf_range(0.6, 1.4)
		

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()	
	$Meteors.add_child(meteor)

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	print("pew")
