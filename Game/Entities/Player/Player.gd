class_name Player
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
	BIT_11 = 1024,
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
const FRICTION = 0.33
const DRAG = 0.33
const SPEED = 8.0
const SLIDE_ENERGY = 120.0
const TOK_KICK = 0.2
const TOK_SERVE = 1.2
