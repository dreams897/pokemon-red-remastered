	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_GIRL
	const OAKSLAB_OAKS_AIDE
	const OAKSLAB_SCIENTIST
	const OAKSLAB_BLUE
	const OAKSLAB_POKE_BALL1
	const OAKSLAB_POKE_BALL2
	const OAKSLAB_POKE_BALL3

OaksLab_MapScripts:
	def_scene_scripts
	scene_script OaksLabOakNotAroundScene, SCENE_OAKSLAB_OAK_NOT_AROUND
	scene_script OaksLabNoop1Scene,   SCENE_OAKSLAB_CANT_LEAVE
	scene_script OaksLabNoop2Scene,   SCENE_OAKSLAB_NOOP
	scene_script OaksLabNoop4Scene,   SCENE_OAKSLAB_UNUSED
	scene_const SCENE_OAKSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks

OaksLabOakNotAroundScene:
	checkevent EVENT_FOLLOWED_OAK_INTO_LAB
	iftrue OaksLabWalkUpToOakScript
	disappear OAKSLAB_OAK
	end

OaksLabNoop1Scene:
	end

OaksLabNoop2Scene:
	end

OaksLabNoop3Scene:
	end

OaksLabNoop4Scene:
	end

OaksLabNoop5Scene:
	end

OaksLabWalkUpToOakScript:
	applymovement PLAYER, OaksLab_WalkUpToOakMovement
	opentext
	writetext OaksLabOakChooseMonText
	waitbutton
	setscene SCENE_OAKSLAB_CANT_LEAVE
	closetext
	end

ProfOakScript:
	faceplayer
	opentext
	checkitem OAKS_PARCEL
	iftrue OaksLabParcelScript
	waitbutton
	closetext
	end
	
OaksAideScript:
	faceplayer
	opentext
	writetext OaksLabScientistText
	promptbutton
	closetext
	end
	
OaksLabGirlScript:
	faceplayer
	opentext
	writetext OaksLabGirlText
	waitbutton
	closetext
	end
	
OaksLabRivalScript:
	faceplayer
	opentext
	writetext OaksLabRivalGrampsIsntAroundText
	waitbutton
	closetext
	end
	
OaksLabParcelScript:
	writetext OaksLabOak1ParcelThanksText
	waitbutton
	takeitem OAKS_PARCEL
	closetext
	setevent EVENT_OAK_GOT_PARCEL
	end

OaksLabTryToLeaveScript:
	turnobject OAKSLAB_OAK, DOWN
	opentext
	writetext OaksLabOakDontGoAwayYetText
	waitbutton
	closetext
	applymovement PLAYER, OaksLab_CantLeaveMovement
	end

CharmanderPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	checkevent EVENT_FOLLOWED_OAK_INTO_LAB
	iffalse OakNotAroundPokeBallsScript
	turnobject OAKSLAB_OAK, DOWN
	reanchormap
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext OaksLabYouWantCharmanderText
	yesorno
	iffalse OaksLabDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_A_CHARMANDER_FROM_OAK
	writetext OaksLabMonEnergeticText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHARMANDER
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON_RBY
	waitsfx
	promptbutton
	givepoke CHARMANDER, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, OakDirectionsScript
	applymovement PLAYER, AfterCharmanderMovement
	sjump OakDirectionsScript

SquirtlePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	checkevent EVENT_FOLLOWED_OAK_INTO_LAB
	iffalse OakNotAroundPokeBallsScript
	turnobject OAKSLAB_OAK, DOWN
	reanchormap
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext OaksLabYouWantSquirtleText
	yesorno
	iffalse OaksLabDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_A_SQUIRTLE_FROM_OAK
	writetext OaksLabMonEnergeticText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, SQUIRTLE
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON_RBY
	waitsfx
	promptbutton
	givepoke SQUIRTLE, 5, BERRY
	closetext
	applymovement PLAYER, AfterSquirtleMovement
	sjump OakDirectionsScript

BulbasaurPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	checkevent EVENT_FOLLOWED_OAK_INTO_LAB
	iffalse OakNotAroundPokeBallsScript
	turnobject OAKSLAB_OAK, DOWN
	reanchormap
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext OaksLabYouWantBulbasaurText
	yesorno
	iffalse OaksLabDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_A_BULBASAUR_FROM_OAK
	writetext OaksLabMonEnergeticText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, BULBASAUR
	writetext OaksLabReceivedStarterText
	playsound SFX_CAUGHT_MON_RBY
	waitsfx
	promptbutton
	givepoke BULBASAUR, 5, BERRY
	closetext
	applymovement PLAYER, AfterBulbasaurMovement
	sjump OakDirectionsScript

OaksLabDidntChooseStarterScript:
	writetext OaksLabDidntChooseStarterText
	waitbutton
	closetext
	end

LookAtOakPokeBallScript:
	opentext
	writetext OakPokeBallText
	waitbutton
	closetext
	end
	
OakNotAroundPokeBallsScript:
	opentext
	writetext OaksLabThoseArePokeBallsText
	waitbutton
	closetext
	end
	
	
OakDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext OaksLabOak1YourPokemonCanFightText
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setscene SCENE_OAKSLAB_AIDE_GIVES_POKE_BALLS
	setmapscene PALLET_TOWN, SCENE_PALLET_TOWN_NOOP
	end

OakJumpUpScript:
	applymovement OAKSLAB_OAK, OakJumpUpMovement
	opentext
	end

OakJumpDownScript:
	applymovement OAKSLAB_OAK, OakJumpDownMovement
	opentext
	end

OakJumpLeftScript:
	applymovement OAKSLAB_OAK, OakJumpLeftMovement
	opentext
	end

OakJumpRightScript:
	applymovement OAKSLAB_OAK, OakJumpRightMovement
	opentext
	end

OakAideScript_WalkBalls1:
	applymovement OAKSLAB_OAKS_AIDE, OakAideWalksRight1
	turnobject PLAYER, DOWN
	scall OakAideScript_GiveYouBalls
	applymovement OAKSLAB_OAKS_AIDE, OakAideWalksLeft1
	end

OakAideScript_WalkBalls2:
	applymovement OAKSLAB_OAKS_AIDE, OakAideWalksRight2
	turnobject PLAYER, DOWN
	scall OakAideScript_GiveYouBalls
	applymovement OAKSLAB_OAKS_AIDE, OakAideWalksLeft2
	end

OakAideScript_GiveYouBalls:
	opentext
	writetext OakAideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall OakAideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext OakAideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_OAKSLAB_NOOP
	end

OakAideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end

OakAideScript_ExplainBalls:
	writetext OakAideText_ExplainBalls
	waitbutton
	closetext
	end
	
OaksLabRivalGrampsIsntAroundText:
	text "<RIVAL>: Yo"
	line "<PLAYER>! Gramps"
	cont "isn't around!"
	done

OaksLabRivalGoAheadAndChooseText:
	text "<RIVAL>: Heh, I"
	line "don't need to be"
	cont "greedy like you!"

	para "Go ahead and"
	line "choose, <PLAYER>!"
	done

OaksLabRivalMyPokemonLooksStrongerText:
	text "<RIVAL>: My"
	line "#MON looks a"
	cont "lot stronger."
	done

OaksLabThoseArePokeBallsText:
	text "Those are #"
	line "BALLs. They"
	cont "contain #MON!"
	done

OaksLabYouWantCharmanderText:
	text "So! You want the"
	line "fire #MON,"
	cont "CHARMANDER?"
	done

OaksLabYouWantSquirtleText:
	text "So! You want the"
	line "water #MON,"
	cont "SQUIRTLE?"
	done

OaksLabYouWantBulbasaurText:
	text "So! You want the"
	line "plant #MON,"
	cont "BULBASAUR?"
	done

OaksLabMonEnergeticText:
	text "This #MON is"
	line "really energetic!"
	prompt

OaksLabReceivedMonText:
	text "<PLAYER> received"
	line "a @"
	text_ram wcd6d
	text "!@"
	text_end

OaksLabLastMonText:
	text "That's PROF.OAK's"
	line "last #MON!"
	done

OaksLabOak1WhichPokemonDoYouWantText:
	text "OAK: Now, <PLAYER>,"
	line "which #MON do"
	cont "you want?"
	done

OaksLabOak1YourPokemonCanFightText:
	text "OAK: If a wild"
	line "#MON appears,"
	cont "your #MON can"
	cont "fight against it!"
	done

OaksLabOak1RaiseYourYoungPokemonText:
	text "OAK: <PLAYER>,"
	line "raise your young"
	cont "#MON by making"
	cont "it fight!"
	done

OaksLabOak1DeliverParcelText:
	text "OAK: Oh, <PLAYER>!"

	para "How is my old"
	line "#MON?"

	para "Well, it seems to"
	line "like you a lot."

	para "You must be"
	line "talented as a"
	cont "#MON trainer!"

	para "What? You have"
	line "something for me?"

	para "<PLAYER> delivered"
	line "OAK's PARCEL.@"
	text_end

OaksLabOak1ParcelThanksText:
	text_start
	para "Ah! This is the"
	line "custom # BALL"
	cont "I ordered!"
	cont "Thank you!"
	done

OaksLabOak1PokemonAroundTheWorldText:
	text "#MON around the"
	line "world wait for"
	cont "you, <PLAYER>!"
	done

OaksLabOak1ReceivedPokeballsText:
	text "OAK: You can't get"
	line "detailed data on"
	cont "#MON by just"
	cont "seeing them."

	para "You must catch"
	line "them! Use these"
	cont "to capture wild"
	cont "#MON."

	para "<PLAYER> got 5"
	line "# BALLs!@"
	text_end

OaksLabGivePokeballsExplanationText:
	text_start
	para "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just throw a #"
	line "BALL at it and try"
	line "to catch it!"

	para "This won't always"
	line "work, though."

	para "A healthy #MON"
	line "could escape. You"
	cont "have to be lucky!"
	done

OaksLabOak1ComeSeeMeSometimesText:
	text "OAK: Come see me"
	line "sometimes."

	para "I want to know how"
	line "your #DEX is"
	cont "coming along."
	done

OaksLabOak1HowIsYourPokedexComingText:
	text "OAK: Good to see "
	line "you! How is your "
	cont "#DEX coming? "
	cont "Here, let me take"
	cont "a look!"
	prompt

OaksLabPokedexText:
	text "It's encyclopedia-"
	line "like, but the"
	cont "pages are blank!"
	done

OaksLabOak2Text:
	text "?"
	done

OaksLabGirlText:
	text "PROF.OAK is the"
	line "authority on"
	cont "#MON!"

	para "Many #MON"
	line "trainers hold him"
	cont "in high regard!"
	done

OaksLabRivalFedUpWithWaitingText:
	text "<RIVAL>: Gramps!"
	line "I'm fed up with"
	cont "waiting!"
	done

OaksLabOakChooseMonText:
	text "OAK: <RIVAL>?"
	line "Let me think..."

	para "Oh, that's right,"
	line "I told you to"
	cont "come! Just wait!"

	para "Here, <PLAYER>!"

	para "There are 3"
	line "#MON here!"

	para "Haha!"

	para "They are inside"
	line "the # BALLs."

	para "When I was young,"
	line "I was a serious"
	cont "#MON trainer!"

	para "In my old age, I"
	line "have only 3 left,"
	cont "but you can have"
	cont "one! Choose!"
	done

OaksLabRivalWhatAboutMeText:
	text "<RIVAL>: Hey!"
	line "Gramps! What"
	cont "about me?"
	done

OaksLabOakBePatientText:
	text "OAK: Be patient!"
	line "<RIVAL>, you can"
	cont "have one too!"
	done

OaksLabOakDontGoAwayYetText:
	text "OAK: Hey! Don't go"
	line "away yet!"
	done

OaksLabRivalIllTakeThisOneText:
	text "<RIVAL>: I'll take"
	line "this one, then!"
	done

OaksLabRivalReceivedMonText:
	text "<RIVAL> received"
	line "a @"
	text_ram wcd6d
	text "!@"
	text_end

OaksLabRivalIllTakeYouOnText:
	text "<RIVAL>: Wait"
	line "<PLAYER>!"
	cont "Let's check out"
	cont "our #MON!"

	para "Come on, I'll take"
	line "you on!"
	done

OaksLabRivalIPickedTheWrongPokemonText:
	text "WHAT?"
	line "Unbelievable!"
	cont "I picked the"
	cont "wrong #MON!"
	prompt

OaksLabRivalAmIGreatOrWhatText:
	text "<RIVAL>: Yeah! Am"
	line "I great or what?"
	prompt

OaksLabRivalSmellYouLaterText:
	text "<RIVAL>: Okay!"
	line "I'll make my"
	cont "#MON fight to"
	cont "toughen it up!"

	para "<PLAYER>! Gramps!"
	line "Smell you later!"
	done

OaksLabRivalGrampsText:
	text "<RIVAL>: Gramps!"
	done

OaksLabRivalWhatDidYouCallMeForText:
	text "<RIVAL>: What did"
	line "you call me for?"
	done

OaksLabOakIHaveARequestText:
	text "OAK: Oh right! I"
	line "have a request"
	cont "of you two."
	done

OaksLabOakMyInventionPokedexText:
	text "On the desk there"
	line "is my invention,"
	cont "#DEX!"

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught!"

	para "It's a hi-tech"
	line "encyclopedia!"
	done

OaksLabOakGotPokedexText:
	text "OAK: <PLAYER> and"
	line "<RIVAL>! Take"
	cont "these with you!"

	para "<PLAYER> got"
	line "#DEX from OAK!@"
	text_end

OaksLabOakThatWasMyDreamText:
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world..."

	para "That was my dream!"

	para "But, I'm too old!"
	line "I can't do it!"

	para "So, I want you two"
	line "to fulfill my"
	cont "dream for me!"

	para "Get moving, you"
	line "two!"

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done

OaksLabRivalLeaveItAllToMeText:
	text "<RIVAL>: Alright"
	line "Gramps! Leave it"
	cont "all to me!"

	para "<PLAYER>, I hate to"
	line "say it, but I"
	cont "don't need you!"

	para "I know! I'll"
	line "borrow a TOWN MAP"
	cont "from my sis!"

	para "I'll tell her not"
	line "to lend you one,"
	cont "<PLAYER>! Hahaha!"
	done

OaksLabScientistText:
	text "I study #MON as"
	line "PROF.OAK's AIDE."
	done

OaksLabTravelTip1:
	jumptext OaksLabTravelTip1Text

OaksLabTravelTip2:
	jumptext OaksLabTravelTip2Text

OaksLabTravelTip3:
	jumptext OaksLabTravelTip3Text

OaksLabTravelTip4:
	jumptext OaksLabTravelTip4Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLab_WalkUpToOakMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OaksLab_CantLeaveMovement:
	step UP
	step_end

OakAideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

OakAideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

OakAideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

OakAideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

OakJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

OakJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

OakJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

OakJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

OaksLab_OakToDefaultPositionMovement1:
	step UP
	step_end

OaksLab_OakToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCharmanderMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterSquirtleMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterBulbasaurMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

OaksLabDidntChooseStarterText:
	text "OAK: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

OaksLabReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

OakPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.OAK."
	done

OakAideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Use these on your"
	line "#DEX quest!"
	done

OakAideText_ExplainBalls:
	text "To add to your"
	line "#DEX, you have"
	cont "to catch #MON."

	para "Throw # BALLS"
	line "at wild #MON"
	cont "to get them."
	done

OaksLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

OaksLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

OaksLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

OaksLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

OaksLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.OAK"
	cont "ate is in there…"
	done

OaksLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…It says on the"
	line "screen…"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 11, PALLET_TOWN, 3
	warp_event  4, 11, PALLET_TOWN, 3

	def_coord_events
	coord_event  4,  6, SCENE_OAKSLAB_CANT_LEAVE, OaksLabTryToLeaveScript
	coord_event  5,  6, SCENE_OAKSLAB_CANT_LEAVE, OaksLabTryToLeaveScript
	coord_event  4,  8, SCENE_OAKSLAB_AIDE_GIVES_POKE_BALLS, OakAideScript_WalkBalls1
	coord_event  5,  8, SCENE_OAKSLAB_AIDE_GIVES_POKE_BALLS, OakAideScript_WalkBalls2

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabTravelTip1
	bg_event  5,  0, BGEVENT_READ, OaksLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, OaksLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, OaksLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_DOWN, OaksLabPC

	def_object_events
	object_event  5,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, -1
	object_event  0, 10, SPRITE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OaksLabGirlScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAideScript, EVENT_OAKS_AIDE_IN_LAB
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAideScript, -1
	object_event  4,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabRivalScript, -1
	object_event  6,  3, SPRITE_POKE_BALL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharmanderPokeBallScript, EVENT_GOT_A_CHARMANDER_FROM_OAK
	object_event  7,  3, SPRITE_POKE_BALL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SquirtlePokeBallScript, EVENT_GOT_A_SQUIRTLE_FROM_OAK
	object_event  8,  3, SPRITE_POKE_BALL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BulbasaurPokeBallScript, EVENT_GOT_A_BULBASAUR_FROM_OAK
