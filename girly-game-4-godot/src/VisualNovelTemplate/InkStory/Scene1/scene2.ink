=== start2 ===

~ background("hallway")

{FriendName} and I walk together through the hallways, getting used to our surroundings. #id:47

Even though we've been here for a few weeks already, it still feels so different from back home. #id:48

~ show_or_hide("Aoi", true)
Aoi (Happy): {PlayerName}, look a Japanese fashion club!

main_character: Japanese fashion club? #id:4a

Aoi (Neutral): Yeah! It says here it's newly formed and they're looking for members. #id:4b

Aoi (Smile): Let's join!

main_character: I don't know... I'm not into Japanese fashion like you are. #id:4d


Aoi (Happy): Come on, it's gonna be fun!

~ change_expression("Aoi", "Neutral")
main_character: But I'm not interested in your fashion kei whatever, {FriendName}! #id:4f

Aoi (Happy): But you'd be so... #id:50

~ speak("Aoi", "kawaii")
Aoi (Smile): Kawaii! #id:51

main_character: Yeah, but it's not something I'm going to wear. #id:52

~ change_expression("Aoi", "Neutral")
main_character: Are there even fashion trends for men? #id:53

Aoi (Confused): {PlayerName} you've asked me that before, of course there are! #id:54

~ change_expression("Aoi", "Neutral")
main_character: Ugh… I don't want to… #id:55

Aoi (Happy): Don't you want to learn more japanese? You can meet Japanese people in here! #id:56

~ speak("Aoi", "kanojo")
Aoi (Mischevious): かのじょ も みつかる かも~ #id:57

main_character: A... what? #id:5a

Aoi (Happy): You know, a かのじょ? You've probably heard that word before... #id:5b

~ change_expression("Aoi", "Neutral")
main_character: Maybe, I don't remember it though. #id:5c

Aoi (Smug): Then let me spell it out for you. At this club, you can find a... #id:5d

~ change_expression("Aoi", "Mischevious")
~ animate("Aoi", "zoom_in")
Aoi (Mischevious): [b]G[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]I[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]R[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]L[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]F[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]R[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]I[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]E[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]N[/b]
~ animate("Aoi", "pulse")
Aoi (Mischevious): [b]D[/b]

~ animate("Aoi", "reset_zoom")

Aoi (Smile): A girlfriend.

main_character: Yeah right... 

~ speak("Aoi", "waratta")
~ animate("Aoi", "pulse")
Aoi (Mischevious): いま、わらった？

Aoi (Mischevious): Seems like your face changed when I mentioned かのじょ...

Aoi (Smug): You definately want a かのじょ, don't you?

main_character: Leave me alone. #id:62

Aoi (Happy): So you're gonna join? #id:63

~ change_expression("Aoi", "Neutral")
main_character: ... 

main_character: Alright fine. But only to learn Japanese, not for any other reasons… #id:65

~ speak("Aoi", "yatta")
~ animate("Aoi", "pulse")
Aoi (Smile): やったぁ！

-> start3