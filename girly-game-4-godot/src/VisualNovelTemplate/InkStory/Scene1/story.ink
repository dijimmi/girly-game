INCLUDE scene1.ink
INCLUDE scene2.ink
INCLUDE scene3.ink

EXTERNAL background(key)
EXTERNAL load_scene(scene)
EXTERNAL speak(who, key)
EXTERNAL move(who, where)
EXTERNAL show_or_hide(who, show)
EXTERNAL change_expression(who, exp)
EXTERNAL play_music(which)
EXTERNAL play_sfx(which)
EXTERNAL animate(who, which)

VAR LEFTEST = 0
VAR LEFT = 1
VAR CENTER = 2
VAR RIGHT = 3
VAR RIGHTEST = 4

VAR FriendName = "Aoi"
VAR PlayerName = "Frank Castle"