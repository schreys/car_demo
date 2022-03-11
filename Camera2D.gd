extends Camera2D

var cam_speed = 3
var car

func _ready():
	car = get_parent().get_node("Car")
	transform = get_new_transformation()
	
func _physics_process(delta):
	position = car.position
	transform = transform.interpolate_with(get_new_transformation(), cam_speed * delta)
	
func get_new_transformation():
	
	var transformx = car.transform.x.rotated(deg2rad(90))
	var transformy = car.transform.y.rotated(deg2rad(90))
	var transformo = car.transform.origin
	
	return Transform2D(transformx, transformy, transformo)
	
	
	#print(get_parent().get_node("Car").transform.rotated(deg2rad(90)))
	
