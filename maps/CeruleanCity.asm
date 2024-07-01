	object_const_def
	const CERULEANCITY_BLUE
	const CERULEANCITY_ROCKET
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD1
	const CERULEANCITY_SUPER_NERD2
	const CERULEANCITY_COP
	const CERULEANCITY_COOLTRAINER_F1
	const CERULEANCITY_SLOWBRO
	const CERULEANCITY_COOLTRAINER_F2
	const CERULEANCITY_SUPER_NERD3
	

CeruleanCity_MapScripts:
	def_scene_scripts
	scene_script CeruleanCityRivalScene, SCENE_CERULEAN_CITY_RIVAL
	scene_script CeruleanCityNoopScene, SCENE_CERULEAN_CITY_NOOP
	scene_script CeruleanCityAfterBillScene, SCENE_CERULEAN_CITY_AFTER_BILL
	scene_script CeruleanCityNoopScene2, SCENE_CERULEAN_CITY_NOOP2
	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCityFlypointCallback

CeruleanCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback
	
CeruleanCityRivalScene:
	end
	
CeruleanCityNoopScene:
	disappear CERULEANCITY_BLUE
	end

CeruleanCityNoopScene2:
	moveobject CERULEANCITY_COP, 28, 12
	disappear CERULEANCITY_ROCKET
	end

CeruleanCityAfterBillScene:
	moveobject CERULEANCITY_COP, 28, 12
	end
	
CeruleanCityRivalBattle2Script:
	playmusic MUSIC_MEET_RIVAL
	showemote EMOTE_SHOCK, PLAYER, 30
	readvar VAR_XCOORD
        getnum STRING_BUFFER_3
        ifequal 20, .RivalWalksToLeft
        ifequal 21, .RivalWalksToRight
	
.RivalWalksToLeft:
	appear CERULEANCITY_BLUE
	applymovement CERULEANCITY_BLUE, Cerulean_Blue_Walk_Down_Movement
	opentext
	writetext CeruleanCityRivalPreBattleText
	waitbutton
	closetext
	setevent EVENT_CERULEAN_RIVAL_WANTS_BATTLE
	sjump Rival2ScriptCont
	
.RivalWalksToRight:
	moveobject CERULEANCITY_BLUE, 21, 2
	appear CERULEANCITY_BLUE
	applymovement CERULEANCITY_BLUE, Cerulean_Blue_Walk_Down_Movement
	opentext
	writetext CeruleanCityRivalPreBattleText
	waitbutton
	closetext
	setevent EVENT_CERULEAN_RIVAL_WANTS_BATTLE
	sjump Rival2ScriptCont
	
Cerulean_Blue_Walk_Down_Movement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
	
Rival2ScriptCont:
	checkevent EVENT_GOT_A_CHARMANDER_FROM_OAK
	iftrue RivalHasSquirtleBattle2
	checkevent EVENT_GOT_A_SQUIRTLE_FROM_OAK
	iftrue RivalHasBulbasaurBattle2
	checkevent EVENT_GOT_A_BULBASAUR_FROM_OAK
	iftrue RivalHasCharmanderBattle2
	
RivalHasCharmanderBattle2:
	winlosstext CeruleanCityRivalDefeatedText, CeruleanCityRivalVictoryText
	loadtrainer BLUE2, BLUE3_CHARMANDER
	startbattle
	reloadmapafterbattle
	opentext
	writetext CeruleanCityRivalIWentToBillsText
	waitbutton
	closetext
	playmusic MUSIC_MEET_RIVAL_ALT
	readvar VAR_XCOORD
        getnum STRING_BUFFER_3
        ifequal 20, RivalLeavesFromLeft
        ifequal 21, RivalLeavesFromRight
	
RivalHasSquirtleBattle2:
	winlosstext CeruleanCityRivalDefeatedText, CeruleanCityRivalVictoryText
	loadtrainer BLUE2, BLUE3_SQUIRTLE
	startbattle
	reloadmapafterbattle
	opentext
	writetext CeruleanCityRivalIWentToBillsText
	waitbutton
	closetext
	playmusic MUSIC_MEET_RIVAL_ALT
	readvar VAR_XCOORD
        getnum STRING_BUFFER_3
        ifequal 20, RivalLeavesFromLeft
        ifequal 21, RivalLeavesFromRight
	
RivalHasBulbasaurBattle2:
	winlosstext CeruleanCityRivalDefeatedText, CeruleanCityRivalVictoryText
	loadtrainer BLUE2, BLUE3_BULBASAUR
	startbattle
	reloadmapafterbattle
	opentext
	writetext CeruleanCityRivalIWentToBillsText
	waitbutton
	closetext
	playmusic MUSIC_MEET_RIVAL_ALT
	readvar VAR_XCOORD
        getnum STRING_BUFFER_3
        ifequal 20, RivalLeavesFromLeft
        ifequal 21, RivalLeavesFromRight
        
RivalLeavesFromLeft:
	applymovement CERULEANCITY_BLUE, CeruleanCityBlueLeaveMovementLeft
	disappear CERULEANCITY_BLUE
	special RestartMapMusic
	setevent EVENT_BEAT_RIVAL_CERULEAN
	setscene SCENE_CERULEAN_CITY_NOOP
	end
	
RivalLeavesFromRight:
	applymovement CERULEANCITY_BLUE, CeruleanCityBlueLeaveMovementRight
	disappear CERULEANCITY_BLUE
	special RestartMapMusic
	setevent EVENT_BEAT_RIVAL_CERULEAN
	setscene SCENE_CERULEAN_CITY_NOOP
	end
	
CeruleanCityBlueLeaveMovementLeft:
	slow_step RIGHT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
	
CeruleanCityBlueLeaveMovementRight:
	slow_step LEFT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerMText
	waitbutton
	closetext
	end
	
CeruleanCityRocketScript:
	turnobject CERULEANCITY_ROCKET, VAR_FACING
	opentext
	checkevent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	iftrue .beatRocketThief
	writetext CeruleanCityRocketText
	playmusic MUSIC_MEET_EVIL_TRAINER
	waitbutton
	closetext
	winlosstext CeruleanCityRocketIGiveUpText, 0
	loadtrainer GRUNTM, ROCKET_CERULEAN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	opentext
.beatRocketThief
	writetext CeruleanCityRocketIllReturnTheTMText
	giveitem TM_DIG
	iffalse .NoRoom
	writetext CeruleanCityRocketReceivedTM28Text
	playsound SFX_GET_ITEM1_1
	waitsfx
	waitbutton
	writetext CeruleanCityRocketIBetterGetMovingText
	waitbutton
	special FadeBlackQuickly
	closetext
	disappear CERULEANCITY_ROCKET
	setscene SCENE_CERULEAN_CITY_NOOP2
	special FadeInQuickly
	end
.NoRoom
	writetext CeruleanCityRocketTM28NoRoomText
	waitbutton
	closetext
	end
	
CeruleanCitySuperNerd1Script:
	faceplayer
	opentext
	writetext CeruleanCitySuperNerd1Text
	waitbutton
	closetext
	end
	
CeruleanCitySuperNerd2Script:
	faceplayer
	opentext
	writetext CeruleanCitySuperNerd2Text
	waitbutton
	closetext
	end
	
CeruleanCityCopScript:
	faceplayer
	opentext
	writetext CeruleanCityCopText
	waitbutton
	closetext
	end
	
CeruleanCitySlowbro:
	faceplayer
	opentext
	random 4
	ifequal 0, .TookASnooze
	ifequal 1, .LoafingAround
	ifequal 2, .TurnedAway
	ifequal 3, .IgnoredOrders
.TookASnooze
	writetext CeruleanCitySlowbroTookASnoozeText
	sjump .backtomain
.IgnoredOrders
	writetext CeruleanCitySlowbroIgnoredOrdersText
	sjump .backtomain
.TurnedAway
	writetext CeruleanCitySlowbroTurnedAwayText
	sjump .backtomain
.LoafingAround
	writetext CeruleanCitySlowbroIsLoafingAroundText
.backtomain
	waitbutton
	closetext
	end

CeruleanCityCooltrainerF1Script:
	faceplayer
	opentext
	random 3
	ifequal 0, .Sonicboom
	ifequal 1, .Punch
	ifequal 2, .Withdraw
.Sonicboom
	writetext CeruleanCityCooltrainerF1SlowbroPunchText
	sjump .backtomain
.Punch
	writetext CeruleanCityCooltrainerF1SlowbroUseSonicboomText
	sjump .backtomain
.Withdraw
	writetext CeruleanCityCooltrainerF1SlowbroWithdrawText
.backtomain
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F1, LEFT
	end
	
CeruleanCityCooltrainerF2Script:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerF2Text
	waitbutton
	closetext
	end
	
CeruleanCitySuperNerd3Script:
	faceplayer
	opentext
	writetext CeruleanCitySuperNerd3Text
	waitbutton
	closetext
	end
	
CeruleanCityHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_HIDDEN_RARE_CANDY_CERULEAN_CITY
	
CeruleanCityRivalPreBattleText:
	text "<RIVAL>: Yo!"
	line "<PLAYER>!"

	para "You're still"
	line "struggling along"
	cont "back here?"

	para "I'm doing great!"
	line "I caught a bunch"
	cont "of strong and"
	cont "smart #MON!"

	para "Here, let me see"
	line "what you caught,"
	cont "<PLAYER>!"
	done

CeruleanCityRivalDefeatedText:
	text "Hey!"
	line "Take it easy!"
	cont "You won already!"
	prompt

CeruleanCityRivalVictoryText:
	text "Heh!"
	line "You're no match"
	cont "for my genius!"
	prompt

CeruleanCityRivalIWentToBillsText:
	text "<RIVAL>: Hey,"
	line "guess what?"

	para "I went to BILL's"
	line "and got him to"
	cont "show me his rare"
	cont "#MON!"

	para "That added a lot"
	line "of pages to my"
	cont "#DEX!"

	para "After all, BILL's"
	line "world famous as a"
	cont "#MANIAC!"

	para "He invented the"
	line "#MON Storage"
	cont "System on PC!"

	para "Since you're using"
	line "his system, go"
	cont "thank him!"

	para "Well, I better"
	line "get rolling!"
	cont "Smell ya later!"
	done

CeruleanCityRocketText:
	text "Hey! Stay out!"
	line "It's not your"
	cont "yard! Huh? Me?"

	para "I'm an innocent"
	line "bystander! Don't"
	cont "you believe me?"
	done

CeruleanCityRocketReceivedTM28Text:
	text "<PLAYER> recovered"
	line "TM28!"
	done

CeruleanCityRocketIBetterGetMovingText:
	text "I better get"
	line "moving! Bye!"
	done

CeruleanCityRocketTM28NoRoomText:
	text "Make room for"
	line "this!"

	para "I can't run until"
	line "I give it to you!"
	done

CeruleanCityRocketIGiveUpText:
	text "Stop!"
	line "I give up! I'll"
	cont "leave quietly!"
	prompt

CeruleanCityRocketIllReturnTheTMText:
	text "OK! I'll return"
	line "the TM I stole!"
	prompt

CeruleanCityCooltrainerMText:
	text "You're a trainer"
	line "too? Collecting,"
	cont "fighting, it's a"
	cont "tough life."
	done

CeruleanCitySuperNerd1Text:
	text "That bush in"
	line "front of the shop"
	cont "is in the way."

	para "There might be a"
	line "way around."
	done

CeruleanCitySuperNerd2Text:
	text "You're making an"
	line "encyclopedia on"
	cont "#MON? That"
	cont "sounds amusing."
	done

CeruleanCityCopText:
	text "The people here"
	line "were robbed."

	para "It's obvious that"
	line "TEAM ROCKET is"
	cont "behind this most"
	cont "heinous crime!"

	para "Even our POLICE"
	line "force has trouble"
	cont "with the ROCKETs!"
	done

CeruleanCityCooltrainerF1SlowbroUseSonicboomText:
	text "OK! SLOWBRO!"
	line "Use SONICBOOM!"
	cont "Come on, SLOWBRO"
	cont "pay attention!"
	done

CeruleanCityCooltrainerF1SlowbroPunchText:
	text "SLOWBRO punch!"
	line "No! You blew it"
	cont "again!"
	done

CeruleanCityCooltrainerF1SlowbroWithdrawText:
	text "SLOWBRO, WITHDRAW!"
	line "No! That's wrong!"

	para "It's so hard to"
	line "control #MON!"

	para "Your #MON's"
	line "obedience depends"
	cont "on your abilities"
	cont "as a trainer!"
	done

CeruleanCitySlowbroTookASnoozeText:
	text "SLOWBRO took a"
	line "snooze..."
	done

CeruleanCitySlowbroIsLoafingAroundText:
	text "SLOWBRO is"
	line "loafing around..."
	done

CeruleanCitySlowbroTurnedAwayText:
	text "SLOWBRO turned"
	line "away..."
	done

CeruleanCitySlowbroIgnoredOrdersText:
	text "SLOWBRO"
	line "ignored orders..."
	done

CeruleanCityCooltrainerF2Text:
	text "I want a bright"
	line "red BICYCLE!"

	para "I'll keep it at"
	line "home, so it won't"
	cont "get dirty!"
	done

CeruleanCitySuperNerd3Text:
	text "This is CERULEAN"
	line "CAVE! Horribly"
	cont "strong #MON"
	cont "live in there!"

	para "The #MON LEAGUE"
	line "champion is the"
	cont "only person who"
	cont "is allowed in!"
	done

CeruleanCitySignText:
	text "CERULEAN CITY"
	line "A Mysterious,"
	cont "Blue Aura"
	cont "Surrounds It"
	done

CeruleanCityTrainerTipsText:
	text "TRAINER TIPS"

	para "Pressing B Button"
	line "during evolution"
	cont "cancels the whole"
	cont "process."
	done

CeruleanCityBikeShopSign:
	text "Grass and caves"
	line "handled easily!"
	
	para "MIRACLE-CYCLE"
	line "BIKE SHOP"
	done

CeruleanCityGymSign:
	text "CERULEAN CITY"
	line "#MON GYM"
	cont "LEADER: MISTY"

	para "The Tomboyish"
	line "Mermaid!"
	done

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanCityGymSign

CeruleanBikeShopSign:
	jumptext CeruleanCityBikeShopSign

CeruleanTrainerTipsSign:
	jumptext CeruleanCityTrainerTipsText

CeruleanCityPokecenterSign:
	jumpstd PokecenterSignScript

CeruleanCityMartSign:
	jumpstd MartSignScript


CeruleanCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 15, 11, CERULEAN_BERRY_SPEECH_HOUSE, 1
	warp_event 27, 11, CERULEAN_TRASHED_HOUSE, 1
	warp_event 13, 15, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 17, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 19, CERULEAN_GYM, 1
	warp_event 25, 25, CERULEAN_MART, 1
	warp_event 13, 25, CERULEAN_BIKE_SHOP, 1
	warp_event  9,  9, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 3
	warp_event 15,  9, CERULEAN_BERRY_SPEECH_HOUSE, 3
	warp_event 27, 9, CERULEAN_TRASHED_HOUSE, 3

	def_coord_events
	coord_event  20,  6, SCENE_CERULEAN_CITY_RIVAL, CeruleanCityRivalBattle2Script
	coord_event  21,  6, SCENE_CERULEAN_CITY_RIVAL, CeruleanCityRivalBattle2Script
	coord_event 30,  9, SCENE_CERULEAN_CITY_AFTER_BILL, CeruleanCityRocketScript

	def_bg_events
	bg_event 23, 19, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 21, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 25, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 17, 29, BGEVENT_READ, CeruleanTrainerTipsSign
	bg_event 20, 17, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 26, 25, BGEVENT_READ, CeruleanCityMartSign
	bg_event 15,  8, BGEVENT_ITEM, CeruleanCityHiddenRareCandy

	def_object_events
	object_event 20,  2, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCityRivalBattle2Script, EVENT_CERULEAN_RIVAL_WANTS_BATTLE
	object_event 30,  8, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanCityRocketScript, -1
	object_event 31, 20, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 15, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerd1Script, -1
	object_event  9, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerd2Script, -1
	object_event 27, 12, SPRITE_GUARD, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCopScript, -1
	object_event 29, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerF1Script, -1
	object_event 28, 26, SPRITE_SLOWBRO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event  9, 27, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerF2Script, -1
	object_event  4, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerd3Script, -1
