=== start3 ===

~ background("fashion_club")

~ move("Aoi", RIGHTEST)
~ move("President", LEFT)
~ show_or_hide("President", true)

~ speak("President", "irasshai")
President (Happy): いらっしゃい !  Hello! Nice to meet ya'll!

~ speak("President", "joining")
President (Happy): Are you guys interested in joining the club?

~ change_expression("President", "Neutral")
~ speak("Aoi", "un")
Aoi (Smile): うん！

main_character: I guess so... 

~ change_expression("Aoi", "Neutral")
~ speak("President", "sign")
President (Happy): Alright, you just need to sign here, and there please.

// Maybe cue a sign sound effect here or a minigame

~ speak("President", "sankyu")
President (Smile): サンキュー!

~ speak("President", "hangout")
President (Happy): You can look around and hang out, we'll be starting our meeting soon. #id:6d

main_character: Thank you. #id:6e

~ speak("Aoi", "hai")
Aoi (Smile): はーい~ #id:6f

~ show_or_hide("President", false)
~ change_expression("Aoi", "Neutral")
~ move("Aoi", CENTER)
main_character: Alright so... I joined. Now I can leave, right?

~ speak("Aoi", "eeh")
Aoi (Confused): ええ?!!

main_character: I'm just messing with you.

~ change_expression("Aoi", "Smug")
main_character: I thought more people would be here...

Aoi (Happy): It's a new club, give it time...

~ animate("Aoi", "pulse")
Aoi (Happy): Oh look, another one is joining!

~ move("Ayumi", LEFTEST)
~ show_or_hide("Ayumi", true)
~ move("Aoi", RIGHTEST)

Ayumi (Smile): Here's my signature! Thanks!

I look at the new girl… She's so…

Kawaii!

No... not just kawaii.

She's... she's...

{FriendName}'s piercing gaze interrupt my thoughts.

~ animate("Aoi", "zoom_in")
// Here we need the player name sound effect
Aoi (Mischevious): Ohoho {PlayerName}~ you like her?

main_character: What? No! What are you talking about?

~ animate("Aoi", "reset_zoom")
Aoi (Smile): Oh, nothing!

~ change_expression("Aoi", "Neutral")
The new girl walks towards us.

~ move("Ayumi", LEFT)

Aoi (Happy): こんにちは!

~ change_expression("Aoi", "Neutral")
main_character: Hello...

// Idk if this has a voiceline
Ayumi (Neutral): Hm?

Ayumi (Smile): Ah! Are you two the new exchange students? Hello!

~ speak("Aoi", "un")
Aoi (Happy): うん!

Aoi (Happy): We just joined

~ change_expression("Aoi", "Neutral")
main_character: Yeah, she dragged me here... 

~ change_expression("Aoi", "Mischevious")
~ animate("Aoi", "pulse")
main_character: *kick* Ow!

~ change_expression("Aoi", "Neutral")
~ speak("Ayumi", "pff_www1")
Ayumi (Laugh): pff- www

~ speak("Ayumi", "nice_to_meet")
Ayumi (Happy): Nice to meet you! Ayumi です!

Ayumi (Happy): And you?

main_character: I'm {PlayerName}, nice to meet you.

~ speak("Aoi", "aoi_desu")
Aoi (Smile): Aoi です!

~ change_expression("Aoi", "Neutral")
main_character: Are you also a transfer student, Ayumi?

~ speak("Ayumi", "zenzen1")
Ayumi (Happy): ぜんぜん~

Ayumi (Smile): I'm from Japan

Ayumi (Confused): Though my father is from the USA.

Ayumi (Smile): So I know English too!

main_character: Ooh, interesting.

~ speak("Aoi", "sugoi")
~ animate("Aoi", "pulse")
Aoi (Smile): すごい!

Ayumi (Happy): Do you come from the US?

~ change_expression("Ayumi", "Neutral")
~ change_expression("Aoi", "Neutral")
main_character: Yeah, we do, although {FriendName} is originally from Japan, but she moved to the US to study. #id:96

main_character: Do you like fashion like Aoi?

~ speak("Ayumi", "hai")
Ayumi (Happy): はい! I do, though I'm not very knowledgeble.

Aoi (Smug): I got you covered!

~ speak("Ayumi", "hontou1")
Ayumi (Excited): ほんとう!?

main_character: Yeah, she's an expert on that stuff.

~ animate("Ayumi", "pulse")
Ayumi: That's great!

~ change_expression("Aoi", "Neutral")
President (Happy): Okay guys, let's get started!

Aoi (Happy): It's starting! We should hurry to join them!

-> END