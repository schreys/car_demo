extends Node2D

var colors = {
	WHITE = Color(1.0, 1.0, 1.0),
	YELLOW = Color(1.0, .757, .027),
	GREEN = Color(.282, .757, .255),
	BLUE = Color(.098, .463, .824),
	PINK = Color(.914, .118, .388)
}

const WIDTH = 4
var car

func _ready():
	car = get_parent().get_node("Car")
	update()

func _draw():
	draw_vector(car.position, car.position + car.heading_pos, colors['GREEN'])
	draw_vector(car.position, car.position + car.acceleration, colors['PINK'])
	draw_vector(car.position, car.position + car.velocity, colors['YELLOW'])
	
func draw_vector(from, to, _color):
	draw_line(from, to, _color, WIDTH)
	var dir = (to-from).normalized()
	draw_triangle_equilateral(to, dir, 10, _color)
	draw_circle(from, 6, _color)

func draw_triangle_equilateral(center=Vector2(), direction=Vector2(), radius=50, _color=colors.WHITE):
	var point_1 = center + direction * radius
	var point_2 = center + direction.rotated(2*PI/3) * radius
	var point_3 = center + direction.rotated(4*PI/3) * radius
	
	var points = PoolVector2Array([point_1, point_2, point_3])
	draw_polygon(points, PoolColorArray([_color]))

func _process(delta):
	update()
