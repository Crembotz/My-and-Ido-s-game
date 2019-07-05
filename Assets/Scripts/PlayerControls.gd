# PlayerControls.gd
extends KinematicBody2D
export var ACCELERATION = 10
const gravity = 10
const FLOOR_NORMAL = Vector2(0,-1)# Used by the move_and_slide function
var motion = Vector2(0,0)# Used to define how much the player will move each frame
const MAX_SPEED = 120
const JUMP_FORCE = -350 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y += gravity
	if(Input.is_action_pressed("ui_right")):
		motion.x = min(motion.x+ACCELERATION,MAX_SPEED)
	elif(Input.is_action_pressed("ui_left")):
		motion.x = max(motion.x-ACCELERATION,-MAX_SPEED)
	else: motion.x = lerp(motion.x,0,0.15)
	if(is_on_floor() && Input.is_action_pressed("ui_up")):
			motion.y = JUMP_FORCE
	motion = move_and_slide(motion,FLOOR_NORMAL)
	

