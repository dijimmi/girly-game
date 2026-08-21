=== start7 ===

// Scene 7: no fashion reunion this time, maybe it gets skipped and you see
// Ayumi in the hallways and ask her why she didn't go to the reunion.

~ background("fashion_club")
~ play_music("scene2")

Really odd that Ayumi wasnt here. She said she would be here… #id:1be

When you walk out of the meeting room, you see Ayumi walking by #id:1bf

main_character: Ayumi! #id:1c0

~ move("Ayumi", CENTER)
~ show_or_hide("Ayumi", true)
~ change_expression("Ayumi", "Worried")

Ayumi (Worried): Oh hey {PlayerName} ~ #id:1c1

main_character: You just missed the meeting. #id:1c2

Ayumi (Worried): Yeah… I wasn't feeling good today. #id:1c3

main_character: May I ask why? #id:1c4

Ayumi (Sad): I don't really want to talk about that here… #id:1c5
Ayumi (Neutral): I was just going to go out to buy myself something. #id:1c6
Ayumi (Confused): Do you want to come? #id:1c7

main_character: Sure, I can go. #id:1c8

~ change_expression("Ayumi", "Smile")
Ayumi (Smile): Great! #id:1c9

// --- Aoi shows up ---
~ move("Ayumi", LEFT)
~ move("Aoi", RIGHT)
~ show_or_hide("Aoi", true)

Aoi (Happy): Yo! Can I join you? #id:1ca

~ animate("Ayumi", "pulse")
Ayumi (Happy): Aoi! #id:1cb
Ayumi (Smile): Sure, come with! #id:1cc
Ayumi (Smile): The more the merrier, as you americans say #id:1cd
~ change_expression("Ayumi", "Laugh")
Ayumi (Laugh): www #id:1ce

~ show_or_hide("Ayumi", false)
~ show_or_hide("Aoi", false)

-> start7_5
