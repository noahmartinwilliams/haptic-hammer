extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var f
var f2
# Called when the node enters the scene tree for the first time.
func _ready():
	# Replace with function body.
	#set_process_input(true)
	f=StreamPeerTCP.new()
	#f2 = StreamPeerTCP.new()
	#f2.connect_to_host("127.0.0.1", 8081)
	#f2.set_no_delay(true)
	var err = f.connect_to_host("127.0.0.1", 8080)
	print(err)
	if f.is_connected_to_host():
		print("connected")
	f.set_no_delay(true)
	#f2=File.new()
	#f.open("/home/noah/robot-arm-proj/game2/pipe.fifo", File.READ)
	#f2.open("/home/noah/robot-arm-proj/game2/pipe2.fifo", File.WRITE)
	set_process(true)
	#f2.store_string("request\n")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#f2.store_string("request\n")
	#f2.close()
	#f2 = File.new()
	#f2.open("/home/noah/robot-arm-proj/game2/pipe2.fifo", File.WRITE)
	#print("request\n")
	#f2.flush()
	#f.put_var("0.0,0.0,0.0")
	#var line = f.get_string(-1)
	#f2.put_string("hello")
	var x
	var y
	var z
	var xStr = ""
	var yStr = ""
	var zStr = ""

	var a =""
	var b
	while true :
		b=f.get_8()
		#print(char(b))
		if char(b) == ',':
			break
		a = a + str(char(b))
	xStr = a 
	a=""
	while true:
		b=f.get_8()
		if char(b) == ',':
			break
		a=a+str(char(b))
	yStr = a
	a=""
	while true:
		b=f.get_8()
		if char(b)=='\n':
			break
		a=a+str(char(b))
	zStr=a
	y = yStr.to_float()
	z = zStr.to_float()
	x = xStr.to_float()
	#print(line)
	#line = line / 100.0
	#self.translate(line)
	#f.close()
	#f = File.new()
	#f.open("/home/noah/robot-arm-proj/game2/pipe.fifo", File.READ)
	#var arr = line.split(",")
	#print(line)
	#if len(arr) == 3:
		#var x = float(arr[0])
		#var y = float(arr[1])
		#var z = float(arr[2])
	#x =x +100.0
	y=y+100.0
	var v = Vector3(z,y,x)
	v=v/75.0
	#var v = Vector3(0.0, 0.0, 0.0)
	#v=v / 1000.0
	#v = v / 10000.0
	print(v)
	#v = v / 100.0
	self.transform.origin = v
	var c = self.get_parent().get_children()[0].get_children()[0].get_children()[0]
	c.look_at(v, Vector3(0.0, 1.0, 0.0))
