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
	if Input.is_action_pressed("ui_down"):
		position.y += delta * speed
	elif Input.is_action_pressed("ui_up"):
		position.y -= delta * speed
	if Input.is_action_pressed("ui_right"):
		position.x += delta * speed
	elif Input.is_action_pressed("ui_left"):
		position.x -= delta * speed


func add_line(pos_start, pos_end):
	print(pos_start, pos_end)
	var line = Line2D.new()
	line.points = [pos_start, pos_end]
	line.width = 2
	line.default_color = Color( 1,1,1,1 )
	# _drawn_nodes.push_back(line)
	add_child(line)
