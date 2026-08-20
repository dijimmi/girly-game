=== start2 ===

~ background("intro")

{FriendName} and I walk together through the hallways, getting used to our surroundings. #id:47

Even though we've been here for a few weeks already, it still feels so different from back home. #id:48
# MISSING TRANSLATION
// join Aoi (Happy) center [animation="Fade In"]
~ show_or_hide("Aoi", true)
Aoi (Smile): {PlayerName}, look a Japanese fashion club! #id:49
# MISSING TRANSLATION

~ change_expression("Aoi", "Neutral")
main_character: Japanese fashion club? #id:4a
# MISSING TRANSLATION
Aoi (Neutral): Yeah! It says here it's newly formed and they're looking for members. #id:4b
# MISSING TRANSLATION
~change_expression("Aoi", "Smile")
Aoi (Smile): Let's join! #id:4c
# MISSING TRANSLATION
main_character: I don't know... I'm not into Japanese fashion like you are. #id:4d
# MISSING TRANSLATION
~ change_expression("Aoi", "Happy")
Aoi (Neutral): Come on, it's gonna be fun! #id:4e
# Aoi (JoySPeaking): ねえ、絶対楽しいって！
~ change_expression("Aoi", "Neutral")
main_character: But I'm not interested in your fashion kei whatever, {FriendName}! #id:4f
# main_character: でも俺、お前の言う「おしゃれ」だか何だかにはあんまり興味ないんだって{AoiName}！
~ change_expression("Aoi", "Happy")
Aoi (Happy): But you'd be so... #id:50

~ change_expression("Aoi", "Smile")
~ speak("Aoi", "kawaii")
Aoi (Smile): Kawaii! #id:51

main_character: Yeah, but it's not something I'm going to wear. #id:52
update Aoi (Neutral)
# main_character: いや、服がかわいくても俺が着るわけじゃないだろ。
main_character: Are there even fashion trends for men? #id:53
# main_character: そもそも男向けにも、そういうファッションの流行ってあるの？
Aoi (Confused): {PlayerName} you've asked me that before, of course there are! #id:54
# Aoi (NeutralSpeaking): {PlayerName}、それ前にも聞いてたよ？ もちろんあるよ！
main_character: Ugh… I don't want to… #id:55
# main_character: んー……やっぱ行きたくない……。
Aoi (Happy): Don't you want to learn more japanese? You can meet Japanese people in here! #id:56
# Aoi (JoySPeaking): 日本語、もっと覚えたいんでしょ？ ここなら日本人とも知り合えるよ！
~ speak("Aoi", "kanojo")
Aoi (Mischievous): かのじょ も みつかる かも~ #id:57
# MISSING TRANSLATION
main_character: A... what? #id:5a
# MISSING TRANSLATION
Aoi (Happy): You know, a かのじょ? You've probably heard that word before... #id:5b
# MISSING TRANSLATION
update Aoi (Neutral)
main_character: Maybe, I don't remember it though. #id:5c
# MISSING TRANSLATION
Aoi (Smug): Then let me spell it out for you. At this club, you can find a... #id:5d

~ change_expression("Aoi", "Mischevious")
~ animate("Aoi", "zoom_in")
Aoi (Smug): [b]G[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]I[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]R[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]L[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]F[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]R[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]I[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]E[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]N[/b]
~ animate("Aoi", "pulse")
Aoi (Smug): [b]D[/b]

~ animate("Aoi", "reset_zoom")
~ change_expression("Aoi", "Smile")

Aoi: A girlfriend.

# MISSING TRANSLATION
main_character: Yeah right... #id:5e
# MISSING TRANSLATION
Aoi (Happy): いま、わらった？ #id:5f
# MISSING TRANSLATION
Aoi (Mischievous): Seems like your face changed when I mentioned kanojo… #id:60
# Aoi: 「彼女」って言った瞬間、表情が変わったよ～…？
Aoi (Smug): You definately want a kanojo, don't you? #id:61
# Aoi (JoySPeaking): やっぱ彼女ほしいんじゃないの～？
main_character: Leave me alone. #id:62
# main_character: ほっとけ。
Aoi (Happy): So you're gonna join? #id:63
# Aoi (JoySPeaking): で、入部する？
update Aoi (Neutral)
main_character: ... #id:64
# main_character: ……。
main_character: Alright fine. But only to learn Japanese, not for any other reasons… #id:65
# main_character: ……わかったよ、入部すればいいんだろ。ただし日本語の勉強のためだからな。それ以外の理由じゃないから……。
Aoi (Smile): やった！ #id:66
leave Aoi
# Aoi (Joy): やったぁ！
# do Dialogue.set_next_scene("cutscene fashion club")
jump scene3_DONE/
# MISSING TRANSLATION

-> END