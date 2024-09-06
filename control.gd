extends Node3D

var active_control_group = 1
@onready var camera = get_node("../CameraGimbal")

func _ready():
  camera.target = get_node(str(active_control_group)).get_child(0)
  
func _physics_process(delta):
  if Input.is_action_just_pressed("l_bumper"):
    cycle_control_group(-1)
  elif Input.is_action_just_pressed("r_bumper"):
    cycle_control_group(1)
    
  
  for unit in get_node(str(active_control_group)).get_children():
    unit.call("move")
    
func cycle_control_group(up_or_down):
  active_control_group = (active_control_group + up_or_down) % 3
  if active_control_group < 0:
    active_control_group += 3
  print(active_control_group)
  camera.target = get_node(str(active_control_group)).get_child(0)
  
