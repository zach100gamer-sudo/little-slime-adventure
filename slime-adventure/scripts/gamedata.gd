# creates a dictionary that stores a string and bool.
extends Node
var player_pos : Vector2
var skills : Dictionary[String, bool] = {
	"absorb" : false,
	"strength" : false,
	"trap" : false,
	"double jump" : false,
}
var current_level : String
var coin_count : int = 0
