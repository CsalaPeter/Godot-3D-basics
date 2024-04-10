extends PanelContainer

@onready var property_container = %Labels

var frames_per_sec : String

func  _ready():
	
	# Set global reference to self in Global Singleton
	Global.debug = self
	
	visible = false
	
	
func  _input(event):
	if event.is_action_pressed("debug"):
		visible = !visible
		

func _process(delta):
	
	add_property("FPS", frames_per_sec, 0)
	
	if visible:
		frames_per_sec = "%.2f" % (1.0/delta)


func add_property(title : String, value, order):
	var target
	target = property_container.find_child(title, true, false)
	if !target:
		target = Label.new()
		property_container.add_child(target)
		target.name = title
		target.text = target.name + ": " + str(value)
	elif visible:
		target.text = title + ": " + str(value)
		property_container.move_child(target, order)
