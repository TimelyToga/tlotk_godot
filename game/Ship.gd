extends KinematicBody

var heading = Vector3(1, 0, 0);
var velocity = heading;
var rot_velocity = 0.0;

const MAX_SPEED = 5;
const ACCELERATION = 20;
const ANGULAR_ACCEL = 0.07;

var camera;
var target;


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _update_camera(delta):
	pass

func _process(delta):
	_update_camera(delta);
	
	rot_velocity = 0;
	var acceleration = Vector3();
	if(Input.is_action_pressed('move_f')):
		acceleration = heading.normalized() * ACCELERATION;
	if(Input.is_action_pressed('move_b')):
		acceleration = heading.normalized() * ACCELERATION * -1;
	if(Input.is_action_pressed('rotate_l')):
		rot_velocity = ANGULAR_ACCEL;
	if(Input.is_action_pressed('rotate_r')):
		rot_velocity = -ANGULAR_ACCEL;
	rotate_y(rot_velocity);
		
	velocity += acceleration * delta;
	var movement = velocity * delta;
	var collision_info = move_and_collide(movement);
	if collision_info: 
		collision_info.collider.queue_free()
	
	heading = transform.basis.z;
