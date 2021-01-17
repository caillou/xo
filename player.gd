extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const size = 25
const speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	add_line(Vector2(-size,-size), Vector2(size,size))
	add_line(Vector2(-size,size), Vector2(size,-size))
	position = Vector2(size,size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var distance = Vector2(0,0)

	if Input.is_action_pressed("ui_down"):
		distance.y = 1
	elif Input.is_action_pressed("ui_up"):
		distance.y = -1
	if Input.is_action_pressed("ui_right"):
		distance.x = 1
	elif Input.is_action_pressed("ui_left"):
		distance.x = -1
	distance = distance.normalized() * speed * delta

	var new_position = position + distance
	var viewport_size = get_viewport().size

	if new_position.x < size:
		new_position.x = size
	elif new_position.x > (viewport_size.x - size):
		new_position.x = (viewport_size.x - size)
	if new_position.y < size:
		new_position.y = size
	elif new_position.y > (viewport_size.y - size):
		new_position.y = (viewport_size.y - size)

	position = new_position

func add_line(pos_start, pos_end):
	print(pos_start, pos_end)
	var line = Line2D.new()
	line.points = [pos_start, pos_end]
	line.width = 2
	line.default_color = Color( 1,1,1,1 )
	# _drawn_nodes.push_back(line)
	add_child(line)
