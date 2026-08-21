=== start6 ===

~ background("fullart1")
~ play_music("scene2")
~ LEVEL = 2.0

// NOTE: en el .dtl la linea #id:141 estaba duplicada, la dejo una sola vez
Aoi (Smug): Looks who's finally here. #id:141

main_character: I know, I know. I know I'm late, I just uhh… #id:142
main_character: Got distracted. #id:143

Aoi (Smug): Sure... #id:144

Ayumi (Happy): Hey {PlayerName}, good to see you! #id:145 // @voice

main_character: Oh hey Ayumi #id:146
main_character: You look…

-> mc_compliment

= mc_compliment
    + [cute]
        main_character: cute #id:147
        ~ animate("Ayumi", "pulse")
        Ayumi (Happy): aw, ありがとう #id:149 // @voice
    + [comfortable]
        main_character: comfortable #id:147
        Ayumi (Smile): I am! #id:148
- -> after_compliment

= after_compliment

~ change_expression("Ayumi", "Smile")
Ayumi (Smile): It was definitely thanks to you though, you were a great help! #id:14b

~ change_expression("Aoi", "Mischevious")
Aoi (Mischevious): {PlayerName}~ #id:14c // @voice

I look at Aoi with a serious look, hoping she can read my mind #id:14d
"Don't embarrass me in front of her!" #id:14e
However, Ayumi doesnt seem to notice #id:14f

main_character: It was nothing! #id:150
main_character: Also, Aoi, that makes us even. #id:151

~ change_expression("Aoi", "Confused")
Aoi (Confused): You definitely arrived later than I did last time! #id:152

main_character: Oh, whatever... #id:153

~ change_expression("Aoi", "Smug")

~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:154

main_character: Also, how did you do on your test? #id:155

~ change_expression("Aoi", "Smug")
Aoi (Smug): I did great, of course. #id:156
Aoi (Smug): I'm very smart. #id:157

main_character: Of course you are very smart, {FriendName}. #id:158
main_character: You hang out with me, that's smart. #id:159

~ change_expression("Aoi", "Laugh")
Aoi (Laugh): Pff- #id:15a

~ animate("Ayumi", "pulse")
Ayumi (Laugh): www #id:15b // @voice
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): You look like you're really good friends talking to each other like that. #id:15c // @voice

main_character: Yeah, we are. #id:15d

~ change_expression("Aoi", "Happy")
Aoi (Happy): {PlayerName} is my bestie, he's a really good person. #id:15e

Ayumi (Confused): How so? #id:15f

~ change_expression("Aoi", "Neutral")
Aoi (Neutral): Well… #id:160
Aoi (Smile): He helped me a lot when I was starting to learn English. #id:161
Aoi (Smug): Well... when we started getting along. At first he didn't stand me, right? #id:162

main_character: Right, I remember, haha. #id:163

~ change_expression("Aoi", "Happy")
Aoi (Happy): It's big thanks to him that I'm able to speak English so fluently. #id:164

main_character: As I said, I'm smart. #id:165

~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:166 // @voice
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): That sounds really nice of you, {PlayerName} #id:167 // @voice

main_character: ありがとう~ #id:168

// --- President interrupts ---
~ move("President", RIGHTEST)
~ show_or_hide("President", true)

President (Confused): Sorry to interrupt! #id:169
President (Happy): It seems you guys were talking but we're about to start. #id:16a

main_character: Alright! #id:16b
main_character: I'll help you guys up. #id:16c

~ change_expression("President", "Neutral")
President (Neutral): Lolita fashion isn't just about asthetic but also empowerment, and freedom. #id:16e

~ play_sfx("applause")
8888888 #id:16f

main_character: It's really interesting learning about this. #id:170

~ animate("Ayumi", "pulse")
Ayumi (Happy): うん! #id:171 // @voice

// --- Aoi leaves ---
~ change_expression("Aoi", "Neutral")
Aoi (Neutral): Alright guys, I need to leave now if I want to make it to the movies. #id:172
Aoi (Smile): I take a lot of time getting dressed, haha. #id:173

main_character: Definitely. #id:174

~ change_expression("Aoi", "Smug")
Aoi (Smug): But I look good, don't I? #id:175

main_character: I'll give you that. #id:176

~ change_expression("Aoi", "Happy")
Aoi (Happy): Alright, bye~ #id:177

Ayumi (Smile): さよなら~ #id:178

~ show_or_hide("Aoi", false)

President (Happy): Thanks everyone for coming! #id:179

main_character: Thank you for hosting! #id:17a

Ayumi (Happy): ありがとう ございます #id:17b // @voice

President (Smile): See you at the movies! #id:17c

main_character: See you! #id:17d

Ayumi (Smile): See you, せんせい! #id:17e

~ show_or_hide("President", false)

a small pause #id:17f

// --- quiet moment, just the two ---
~ move("Ayumi", CENTER)

Ayumi (Neutral): I think im going to stay here a bit and enjoy the breeze. #id:180

main_character: Hm? #id:181
main_character: Mind if I join you? #id:182

~ change_expression("Ayumi", "Smile")
Ayumi (Smile): Oh okay! #id:183

~ play_sfx("sit_grass")
I sit down in the grass #id:184

Ayumi (Happy): Ah, this is nice. #id:185
Ayumi (Smile): I really like sitting down and just feeling the breeze you know? #id:186

main_character: By yourself? #id:187

Ayumi (Neutral): Usually, yeah #id:188
Ayumi (Neutral): My friends usually just hang out playing videogames, going to the movies… #id:189
Ayumi (Smile): But I like talking, chlling. #id:18a

main_character: Sou desu #id:18b

Ayumi (Confused): What about you? What do you like to do with your friends? #id:18c

main_character: I'm really down to whatever. #id:18d
main_character: Watching movies, dining out, going to arcades, talking, it varies. #id:18e
main_character: But I get you. Not everyone wants to just chill. #id:18f

~ change_expression("Ayumi", "Neutral")
Ayumi (Neutral): Yeah… #id:190

I catch myself staring at Ayumi's hair moving with the wind. #id:191

Ayumi (Neutral): {PlayerName} #id:192 // @voice

main_character: Yeah? #id:193

Ayumi (Confused): Can I ask you a weird question? #id:194

main_character: Ask me anything, go ahead. #id:195

Ayumi (Sad): Do you ever feel like… #id:196
Ayumi (Sad): You can't be yourself with your friends? #id:197
Ayumi (Sad): Or with a friend? #id:198

main_character: Hmm, I don't think so, no. #id:199
main_character: Especially not with {FriendName}, she's my best friend. #id:19a
main_character: And with my other friends… #id:19b
main_character: Well… I don't have to share everything about me with them, you know? #id:19c
main_character: It depends on how much trust I have in them. #id:19d
main_character: Does that make sense? #id:19e

~ change_expression("Ayumi", "Neutral")
Ayumi (Neutral): うん! #id:19f

main_character: Why do you ask? #id:1a0

Ayumi (Sad): I don't know… #id:1a1
// NOTE: en el .dtl esta linea decia "main_character" pero es de Ayumi
Ayumi (Sad): I feel like my friends would mock me if they knew I went to a fashion club… #id:1a2

main_character: Really? #id:1a3
main_character: Isn't fashion like something big in Japan? #id:1a4

Ayumi (Sad): It is, but I don't know... #id:1a5
Ayumi (Sad): It's a little embarrassing. #id:1a6

main_character: Nah, I'm sure they won't mock you! #id:1a7
main_character: Especially if they're good friends like {FriendName} is to me #id:1a8

Ayumi (Sad): I'm not that close with any of my friends. #id:1a9
Ayumi (Sad): I could never joke around like that haha. #id:1aa

main_character: I think you should give a shot still! #id:1ab
main_character: Tell them, and see how they react. #id:1ac
main_character: I'm sure they'll be more than okay with it. #id:1ad

~ change_expression("Ayumi", "Confused")
Ayumi (Confused): You think? #id:1ae

main_character: うん! #id:1af // @voice

Ayumi (Neutral): Hmm #id:1b0
~ change_expression("Ayumi", "Smile")
Ayumi (Smile): I'll think about it then. #id:1b1
Ayumi (Smile): Thank you. #id:1b2

main_character: Ah it's no biggie. #id:1b3

~ change_expression("Ayumi", "Neutral")
Ayumi (Neutral): Anyhow, I think we better get going to the movies, or we'll be late. #id:1b4

main_character: Good idea. #id:1b5
main_character: And Ayumi? #id:1b6

~ change_expression("Ayumi", "Confused")
Ayumi (Confused): eh? #id:1b7

main_character: I think it's cool you like fashion. It fits you really well. #id:1b8

-> mc_pretty

= mc_pretty
    + [Tell her she looks pretty]
        main_character: And… you look really pretty today. #id:1b9
        ~ animate("Ayumi", "zoom_in")
        Ayumi (Excited): ええ? #id:1ba // @voice
        ~ animate("Ayumi", "reset_zoom")
    + [Say nothing else]
        main_character: ...that's all I wanted to say. #id:1b9
        Ayumi (Confused): ええ? #id:1ba // @voice
- -> after_pretty

= after_pretty

~ change_expression("Ayumi", "Smile")
Ayumi (Smile): ありがとう ございます~ #id:1bb // @voice
Ayumi (Happy): Let's go! #id:1bc

~ show_or_hide("Ayumi", false)

// transition to new scene #id:1bd
~ load_scene("website2")
-> start7
