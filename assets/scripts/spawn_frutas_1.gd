extends Marker3D

@export var naranja = preload("res://scenes/naranja.tscn")
@export var anana = preload("res://scenes/anana.tscn")
var array_frutas : Array
# Called when the node enters the scene tree for the first time.
func _ready():
	array_frutas = [naranja, anana]
	#array_frutas.append(naranja)
	#array_frutas.append(anana)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var nueva_fruta = array_frutas.pick_random().instantiate()
	add_child(nueva_fruta)
	#var nueva_naranja = naranja.instantiate()
	#add_child(nueva_naranja)
	#nueva_naranja.body_entered.connect(nueva_naranja._on_body_entered.bind())
