extends ProgressBar

var parent
var max_valuea_amount
var min_value_amount

func _ready():
	parent = get_parent()
	max_valuea_amount = parent.health_max
	min_value_amount = parent.health_min

func _process(_delta):
	self.value = parent.health
	if parent.health != max_valuea_amount:
		self.visible = true 
		if parent.health == min_value_amount:
			self.visible = false
	else:
		self.visible = false
