extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var active_control_group = 1


func _physics_process(delta):
  # Add the gravity.
  if not is_on_floor():
    velocity += get_gravity() * delta

  move_and_slide()

func move():
   # Get the input direction and handle the movement/deceleration.
  # As good practice, you should replace UI actions with custom gameplay actions.
  var input_dir = Input.get_vector("l_stick_left", "l_stick_right", "l_stick_up", "l_stick_down")
  var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
  if direction:
    velocity.x = direction.x * SPEED
    velocity.z = direction.z * SPEED
  else:
    velocity.x = move_toward(velocity.x, 0, SPEED)
    velocity.z = move_toward(velocity.z, 0, SPEED)
