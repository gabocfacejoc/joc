extends Node2D

var mouse_angle = get_angle_to(get_global_mouse_position())

func _draw():
	print(mouse_angle)
	var center = Vector2(200, 200)
	var radius = 80
	var color = Color(1.0, 0.0, 0.0)
	
	var angle_size = 100
	
	var angle_from = mouse_angle - angle_size/2
	var angle_to = mouse_angle + angle_size/2
	
	draw_circle_arc_poly(center, radius, angle_from, angle_to, color)

func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)

func _process(delta):
	var mouse_angle = get_angle_to(get_global_mouse_position())
	update()
