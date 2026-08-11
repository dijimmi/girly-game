extends Node

const FEATURED = "Featured Products"

var products : Array

func make_clickable(text) -> String:
	return "[url=%s]%s[/url]" % [text, text]
