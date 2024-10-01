extends Node

var tankMaxLevel: int = 1000
var currentLevel: int = 1000

var usedWater: int = 0

func initialize_stats(_tankMaxLevel: int, _currentLevel: int):
	tankMaxLevel = _tankMaxLevel
	currentLevel = _currentLevel
	usedWater = 0
