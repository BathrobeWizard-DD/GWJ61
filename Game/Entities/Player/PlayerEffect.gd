class_name PlayerEffect
extends Node
## State Action that can be performed by the player
##
## This is a base class for all player actions. It is used to define
## the interface for all player actions.

var velocity: Vector3 = Vector3.ZERO

var condition
var movement
var action


## Checks the overall state of the player and returns whether this
## the action can be performed in the current state.
func is_enabled(_player: PlayerController) -> bool:
	return false


## Performs the defined action that returns a PlayerEffect or nothing
## Indicating that the action has effect or not.
func handle(_player: PlayerController, _event) -> PlayerEffect:
	return null
