extends Camera


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_physics_process(true);
	set_as_toplevel(true);
	set_process_input(true)

func _process(delta):
	pass 
	
func _input(event):
	if event is InputEventMagnifyGesture:
		var new_y = transform.origin.y * (1/event.factor)
		transform.origin.y = new_y
		
	if event is InputEventPanGesture: 
		transform.origin.x += event.delta.x
		transform.origin.z += event.delta.y
		
	if event is InputEventJoypadMotion:
		print(event)
	if(event is InputEventMouseButton):
		print(event)
		if(event.button_index == BUTTON_WHEEL_UP):
			set_zoom(0.25 + get_zoom())
	elif event is InputEventScreenDrag:
		set_zoom(0.25 + get_zoom());
	

	
