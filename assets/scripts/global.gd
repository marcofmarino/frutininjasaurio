extends Node

var vidas: int = 3

var puntos_totales: int = 00000
var vida: int = 3
var combo_total: int = 0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func sumar_puntos(puntos_frutas: int) -> void:
	puntos_totales += puntos_frutas

# Called every frame. 'delta' is the elapsed time since the previous frame.
func restar_vidas() -> void:
	vida -= 1

func sumar_combo(puntos_combo: int) -> void:
	combo_total += puntos_combo
