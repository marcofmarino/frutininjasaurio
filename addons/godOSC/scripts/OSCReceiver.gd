@icon("res://addons/godOSC/images/OSCReceiver.svg")
class_name OSCReceiver
extends Node
## Generic node for Receiving OSC messages. Must have an active OSCServer in the scene to work. 
## Make this node the child of a node you want to control with OSC. To add your own code, extend the 
## script attached to the OSCReceiver you create by right clicking and "extend script"

## The OSCServer to receive messages from
@export var target_server : OSCServer
@export var label : Label
## The OSC address to receive
@export var osc_address := "/example"

## Get the parent of this node
@onready var parent = get_parent()


func _physics_process(delta):
	if target_server.incoming_messages.has(osc_address):
		if  target_server.incoming_messages[osc_address].size() > 0:
			if (target_server.incoming_messages[osc_address][1] < -0.3 or target_server.incoming_messages[osc_address][1] > 0.3) or (target_server.incoming_messages[osc_address][2] < -0.3 or target_server.incoming_messages[osc_address][2] > 0.3):
				get_parent().get_parent().cortar()
		target_server.incoming_messages.clear()
