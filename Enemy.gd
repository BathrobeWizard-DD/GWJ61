class_name Enemy
extends Node

enum Condition {
	ALIVE = 1,
	HURT = 2,
	HEALING = 4,
	DEAD = 8,
}

enum Movement {
	IDLE = 16,
	WALKING = 32,
	RUNNING = 64,
	CROUCHING = 128,
	SLIDING = 256,
	JUMPING = 512,
	FALLING = 1024,
	BIT_12 = 2048,
}

enum Action {
	NONE = 4096,
	INTERACTING = 8192,
	AIMING = 16384,
	ATTACKING = 32768,
	BIT_17 = 65536,
	BIT_18 = 131072,
}

const JUMP_VELOCITY = 15.5
const JUMP_DRAG = 0.28

const MOVEMENT_SPEED = 6.0
const MOVEMENT_FRICTION = 0.33

const SLIDE_ENERGY = 48.0
const SLIDE_FRICTION = 0.10
