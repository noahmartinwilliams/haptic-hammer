extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var times_hit = 0
func _area_entered(_area):
	self.translate(Vector3(0.0, -0.1, 0.0))
	times_hit = times_hit + 1
	if times_hit > 10:
		self.translate(Vector3(0.0, 1.1, 0.0))
		times_hit=0
		#get_node("win").set_text("You Win!")
	self.get_parent().get_children()[4].play()
	var t = Timer.new()
	t.set_wait_time(0.45)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	self.get_parent().get_children()[4].stop()
	
func _ready():
	self.connect("area_entered", self, "_area_entered")

