=== start4 ===

~ background("fashion_club")
// ~ play_music("scene2")

~ move("Aoi", CENTER)
~ show_or_hide("Aoi", true)

Aoi (Happy): It was so nice meeting other people that are into J-fashion~ it's only our first day and I've already learned so many things! #id:9f

main_character: うそつき! I'm sure you knew all that already. #id:a0

Aoi (Smug): Oh, so that word you do know? #id:a1

main_character: I know some… #id:a2

Aoi (Smile): Anyways, I'm going to talk to the President about something, I'll catch you outside. #id:a3

main_character: Alright, bye bye

~ show_or_hide("Aoi", false)

// --- Ayumi enters ---
~ move("Ayumi", CENTER)
~ show_or_hide("Ayumi", true)

// ~ speak("Ayumi", "imouto")
Ayumi (Confused): いもうと なの? #id:a5

main_character: Uhh, if you're asking if she's my sister, no, she's my best friend. #id:a6

Ayumi (Smile): Ah I see! #id:a7
Ayumi (Laugh): You do seem like good friends, haha. #id:a8

main_character: Yeah, we are. #id:a9
main_character: We're pretty different though. She's crazy over fashion, while I'm… #id:aa

// ~ play_sfx("cough")
\*cough* *cough* #id:ab

main_character: Still learning- #id:ac

Ayumi (Neutral): そう... #id:ad

main_character: You surely know more than me though... #id:ae

Ayumi (Smile): I don't know, I've always seen kawaii-fashion and knew it existed, but it's when I tried it on that something felt like it just clicked. #id:af

Ayumi (Neutral): I've bought a few pieces, but I'm no expert. #id:b0

main_character: I'm sure your outfits look great! #id:b1

~ animate("Ayumi", "pulse")
// ~ speak("Ayumi", "arigatou1")
Ayumi (Happy): Arigatou~

Ayumi (Neutral): Ah, the President needs to lock the room, we should go, it was nice to meet you! #id:b3

main_character: Wait… #id:b4

~ animate("Ayumi", "pulse")
// ~ speak("Ayumi", "eeh1")
Ayumi (Worried): Eh? #id:b5

main_character: I was wondering… #id:b6
main_character: Since we're both learning. #id:b7
main_character: What if I help you get accessories for your next outfit? #id:b8
main_character: Just so I can learn a bit more, you know? #id:b9
main_character: Go easy on me though. #id:ba

// ~ speak("Ayumi", "eeh1")
~ animate("Ayumi", "pulse")
Ayumi (Worried): ええ? #id:bb

Ayumi (Worried): なに? #id:bc

Ayumi (Confused): You want choose my next oufit? #id:bd

main_character: No no, not choose, just pick out an accessory for you. #id:be
main_character: I just want to practice Japanese a bit- #id:bf
main_character: So you just have to send me a website and I'll check it out! #id:c0

~ change_expression("Ayumi", "Neutral")
Ayumi (Neutral): そう... #id:c1
Ayumi (Neutral): I... #id:c2
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): I think I'm okay with that! #id:c3
Ayumi (Smile): I'll give you my number just in case. #id:c4

main_character: ありがとう. #id:c5
main_character: I'll send you the link when I choose it. #id:c6

~ animate("Ayumi", "pulse")
Ayumi (Happy): うん、まかせて! #id:c7 // @voice
Ayumi (Smile): See you later! #id:c8

~ show_or_hide("Ayumi", false)

// ~ load_scene("website1")
-> END
