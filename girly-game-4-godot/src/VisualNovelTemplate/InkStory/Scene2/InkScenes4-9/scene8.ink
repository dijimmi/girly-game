=== start8 ===

~ background("fashion_con")
~ play_music("scene2")

I'm really nervous… #id:25a
When will Ayumi arrive? #id:25b
Did I choose the wrong outfit? Is she mad at me? #id:25c
… #id:25d
What has gotten into me? #id:25e
Being anxious is so unlike me… #id:25f

I look at the other people that have gathered here. They all wear different fashion styles. #id:260
~ play_sfx("phone_ring")
While I look for costume similar to the one Ayumi will be wearing, I hear my phone ring in my pocket. #id:261

main_character: Hello? #id:262
Ayumi: {PlayerName}! Where are you? #id:263

main_character: I'm here! Next to the… #id:264
main_character: Anime booth. #id:265

Ayumi: Oh oh, I think I see you. #id:266

main_character: Where??? #id:267

~ play_sfx("hang_up")
She hangs up. #id:268

~ animate("Ayumi", "pulse")
Ayumi: {PlayerName}! #id:269 // @voice

Ayumi appears behind a wall. #id:26a

~ move("Ayumi", CENTER)
~ show_or_hide("Ayumi", true)
~ change_expression("Ayumi", "Happy")

Before you can turn around, Ayumi walks in front of you, wearing the dress you picked out for her. #id:26b

main_character: Ayumi! #id:26c

Ayumi (Happy): Good to see you! #id:26d
Ayumi (Smile): {PlayerName}~ #id:26e // @voice

main_character: You look… #id:26f
I hold myself back before I say something embarrassing. #id:270

// TODO: texto pequeño, quizas un tag propio tipo #small
main_character: sugoi… #id:271
main_character: Kawaii, very kawaii. #id:272

~ animate("Ayumi", "pulse")
Ayumi (Happy): Arigatou~ #id:273 // @voice
Ayumi (Smile): I really like the outfit you chose for me. #id:274
Ayumi (Smile): Thanks a lot! #id:275

main_character: Ah, it's nothing. I'm glad you like it. #id:276
main_character: I've become quite the fashionist, right? #id:277

~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:278 // @voice
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): un~ #id:279 // @voice

main_character: Better than Aoi? #id:27a

// --- Aoi appears ---
~ move("Ayumi", LEFT)
~ move("Aoi", RIGHT)
~ show_or_hide("Aoi", true)
~ change_expression("Aoi", "Smug")

Aoi (Smug): Did I hear my name? #id:27b

main_character: Aoi! #id:27c

main_character: I didn't know you'd be here. #id:27d

~ change_expression("Aoi", "Mischevious")
Aoi (Mischevious): Surprise surprise. #id:27e
~ change_expression("Aoi", "Happy")
Aoi (Happy): I just came to say hi and buy some things. #id:27f

main_character: Oh I see I see. #id:280

Ayumi (Happy): Good to see you, Aoi! #id:281

Aoi (Happy): Likewise! #id:282
Aoi (Smile): I'll see you two later. #id:283
Aoi (Happy): Have fun! #id:284

main_character: See ya! #id:285

Ayumi (Smile): Sayonara! #id:286 // @voice

~ show_or_hide("Aoi", false)
Aoi leaves. #id:287

// --- the confession ---
~ move("Ayumi", CENTER)
~ change_expression("Ayumi", "Neutral")

Ayumi (Neutral): Now that we're here, just the two of us… #id:288
Ayumi (Confused): I wonder… #id:289
// TODO: expresion "Blush" si la llegas a tener
Ayumi (Confused): Does that make this… a date? #id:28a

~ animate("Ayumi", "zoom_in")
main_character: A DATE? #id:28b
~ animate("Ayumi", "reset_zoom")

~ play_sfx("cough")
I clear my throat. #id:28c

main_character: Sorry, that caught me off guard. #id:28d
main_character: Why do you say that? #id:28e

Ayumi (Confused): Well… #id:28f
Ayumi (Confused): I feel we've been friends for a while now… #id:290
Ayumi (Smile): And you know, since you've been so nice to me, helping me choose my outfits. #id:291
Ayumi (Confused): I thought that meant that you like me. #id:292

Oop, what's going on... #id:293

~ animate("Ayumi", "zoom_in")
Ayumi (Confused): {PlayerName}~ #id:294 // @voice
Ayumi (Confused): Do you like me? #id:295
~ animate("Ayumi", "reset_zoom")

What do I do now…? #id:296
I never thought this would happen... #id:297
Not like this... #id:298
Not that I didn't want this or anything, but… #id:299

main_character: I… #id:29a

~ animate("Ayumi", "pulse")
Ayumi (Excited): ええ? #id:29b // @voice

main_character: I do... #id:29c

Ayumi (Excited): Hontou? #id:29d

main_character: はい. I like you... a lot~ #id:29e

Why did I have to say it like that? #id:29f
I sound so cringe! #id:2a0

~ animate("Ayumi", "pulse")
Ayumi (Excited): That makes me so happy! #id:2a1 // @voice
~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:2a2 // @voice
~ change_expression("Ayumi", "Mischevious")
Ayumi (Mischevious): To be honest… #id:2a3
Ayumi (Mischevious): I was afraid to be wrong, so I cheated a little bit. #id:2a4
Ayumi (Mischevious): And I asked Aoi first. #id:2a5

main_character: What!? #id:2a6

~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:2a7 // @voice
Ayumi (Smile): That's why she was here. #id:2a8
Ayumi (Smile): To help me get past my nervousness. #id:2a9

main_character: Tch- Aoi… #id:2aa
main_character: I'm gonna have a talk with her once I get home… #id:2ab
main_character: She is in so much trouble… #id:2ac

Ayumi and I look at each other and laugh. #id:2ad

~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:2ae // @voice
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): So… do you want to walk around with me? #id:2af

main_character: yeah
main_character: I do #id:2b0

~ show_or_hide("Ayumi", false)
~ background("black")

You walk around the mall with Ayumi talking about various things #id:2b1
Fashion #id:2b2
Friends #id:2b3
Coincidences #id:2b4

// TODO: [more description but Im lazy to write it] #id:2b5

// NOTE: dijiste que hay que cambiar esto porque no existe el art del parque
In the end, we went back to the park where we used to sit on the grass. #id:2b6

-> start9
