=== start5 ===

~ background("river_afternoon")
~ play_music("scene2")
~ LEVEL = 1.0

~ move("President", CENTER)
~ show_or_hide("President", true)

President (Happy): Hello everyone! こんにちは! #id:ca // @voice

main_character: Hello! #id:cb

~ change_expression("President", "Confused")
President (Confused): is Aoi not coming to the meetup, {PlayerName}? #id:cc

main_character: I'm not sure, I thought she was already here. #id:cd

~ change_expression("President", "Neutral")
President (Neutral): Sou~ #id:ce
President (Neutral): Maybe she's running late. #id:cf

main_character: Possibly. #id:d0

~ show_or_hide("President", false)

I wonder... where is Ayumi? #id:d1

~ play_sfx("footsteps")
(footsteps) #id:d2

~ background("fullart1")

Ayumi: {PlayerName}! #id:d3 // @voice

main_character: Ayumi! #id:d4

// NOTE: en el .dtl estas 2 lineas estaban etiquetadas como "Ayumi" pero son narracion del MC
Taking a look at her outfit, I feel my cheeks burning. #id:d5
I was not expecting her to look so pretty… #id:d6
At least Aoi isn't here. #id:d7
I wouldn't want her to see me like this, how embarrassing. #id:d8

// NOTE: en el .dtl esto era "main_character" pero el comentario JP dice Ayumi
Ayumi (Smile): こんにちは, げんき です か? #id:d9

main_character: げんき です! #id:da
main_character: あなた は かわいい です! #id:db

~ animate("Ayumi", "pulse")
Ayumi (Happy): ありがとう! #id:dc
Ayumi (Smile): What you bought fit me very well, thank you so much! #id:dd

main_character: No problem! It helped me learn some Japanese so I don't mind. #id:de

~ change_expression("Ayumi", "Confused")
Ayumi (Confused): ほんと? #id:df

main_character: うん! #id:e0
main_character: ロリータ ファッション は、かわいい です #id:e1
main_character: I think I said it right. #id:e2

~ change_expression("Ayumi", "Smile")
Ayumi (Smile): はい #id:e3

// --- Aoi arrives ---
~ background("fullart1_w_aoi")

~ speak("Aoi", "sugoi")
~ animate("Aoi", "pulse")
Aoi (Smile): すごい! #id:e4
Aoi (Happy): You look so pretty! #id:e5

Ayumi (Happy): Aoi! #id:e6
Ayumi (Smile): ありがとう~ #id:e7

main_character: Hey, Aoi, I'm glad you made it! #id:e8

// NOTE: en el .dtl estas 2 lineas decian "Ayumi" pero por contexto son de Aoi
Aoi (Happy): I did! #id:e9
Aoi (Smile): I lost track of time and almost didn't make it, but I did. #id:ea

Ayumi (Happy): I'm glad you made it too, Aoi! #id:eb
Ayumi (Smile): Let's have a great time! #id:ec

~ background("black")

After a few group activities, the presdent says their goodbyes and the other members leave as well. #id:ee

~ background("fullart1")

Ayumi (Happy): きょう　は　たのしかった！ #id:ef

main_character: Yeah, definitely! #id:f0
main_character: It's cool to learn about Japanese culture. #id:f1
main_character: And also listen to you guys talk in Japanese even though I don't understand half of it, haha. #id:f2

~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:f3
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): You'll get there one day, keep practicing! #id:f4

main_character: I will, I will... #id:f5
main_character: Actually, I was thinking, if you had the time... #id:f6
main_character: Could help me practice my japanese skills? #id:f7

~ change_expression("Ayumi", "Confused")
Ayumi (Confused): How so? #id:f8

main_character: Well, I don't know, talk to me about yourself, but in Japanese and I'll try to figure out what you're saying. #id:f9

~ change_expression("Ayumi", "Smile")
Ayumi (Smile): Hmm okay! #id:fa
Ayumi (Smile): Let's start easy then. #id:fb

Ayumi (Happy): ファッション, うたう, だんす　そして　アニメ　を　みる　が　すき　です. #id:103

main_character: Anime? You like anime? #id:104

~ animate("Ayumi", "pulse")
Ayumi (Happy): はい！! #id:105 // @voice

main_character: I love anime too, I'm such a fan of shonen like Jujustu Kaisen, Black Clover, One Punch Man… #id:106
main_character: They're really cool, you should watch them. #id:107
main_character: My friend Aoi watched them with me but she says it's not her type. #id:108

~ change_expression("Ayumi", "Confused")
Ayumi (Confused): I'll have to agree with her, unfortunately. #id:109
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): I'm more into romance or slice of life animes. #id:10a

main_character: Ah that's fair. #id:10b
main_character: You said you sing too? #id:10c

~ animate("Ayumi", "pulse")
Ayumi (Excited): YES! Oh maybe your Japanese is not so bad after all. #id:10d

main_character: Maybe I've been studying… #id:10e
main_character: But hear me out, if you can sing, my favorite anime's intro… #id:10f
main_character: We can be friends. #id:110

Ayumi (Confused): Which anime would that be? #id:111

main_character: Probably One Punch Man? #id:112

~ change_expression("Ayumi", "Smile")
Ayumi (Smile): I mean… #id:113
Ayumi (Smile): It can't be that hard… #id:114
~ animate("Ayumi", "zoom_in")
Ayumi (Excited): One PUUUUUUUUUUNCH #id:115 // @voice
~ animate("Ayumi", "reset_zoom")

main_character: Haha, you nailed it. #id:116
main_character: I declare us, officialy, friends. #id:117

~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:118 // @voice

main_character: No, but what do you usually like to sing? #id:119

~ change_expression("Ayumi", "Confused")
Ayumi (Confused): Umm… #id:11a
Ayumi (Confused): I haven't sung in a while, actually… #id:11b

main_character: Oh, really. May I ask why? #id:11c

Ayumi (Sad): It's a long story… #id:11d
Ayumi (Sad): I don't want to get into it right now. #id:11e

main_character: Oh, ごめん！ #id:11f

~ change_expression("Ayumi", "Smile")
Ayumi (Smile): Don't worry! #id:120

~ change_expression("Ayumi", "Neutral")
The two of you stay quiet for a few seconds. #id:121

main_character: Everyone already left… #id:122

Ayumi (Neutral): Yeah, they did a while ago. #id:123
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): But it's fun talking with you, {PlayerName} #id:124

main_character: Likewise. #id:125

main_character: So, since I chose your accessory correctly this time. #id:131
main_character: Would you like some help choosing your next outfit? #id:132

~ change_expression("Ayumi", "Confused")
~ animate("Ayumi", "pulse")
Ayumi (Confused): ええ? #id:133 // @voice
// TODO: expresion "Blush" si la llegas a tener
Ayumi (Confused): ほんと? #id:134 // @voice

I nod. #id:135

Ayumi (Neutral): Mmm, let me think. #id:136
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): I would love to! #id:137
Ayumi (Smile): I'm probably going to use the same dress, so #id:138
Ayumi (Happy): Find me another headpiece that goes with it! #id:139
Ayumi (Happy): Should have pastel colors, and I want it to be small, okay?

main_character: I think I already have something in mind. #id:13a

~ change_expression("Ayumi", "Mischevious")
Ayumi (Mischevious): Great! If you have any questions you can text me too ;) #id:13b

main_character: Pfft, im an expert already, come on. #id:13c

~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:13d // @voice
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): Alright then, I'll see you next week! #id:13e

main_character: See ya! #id:13f

~ show_or_hide("Ayumi", false)

// [cue website 2 minigame] #id:140
~ load_scene("website2")
-> start6
