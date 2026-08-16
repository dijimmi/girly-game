extends Node

signal change_fullart2(who, expression)

func change_expression(who, expression):
	change_fullart2.emit(who, expression)
