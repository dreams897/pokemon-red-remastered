	object_const_def
	const SSANNE2F_WAITER
	const SSANNE2F_RIVAL
	
SSAnne2F_MapScripts:
	def_scene_scripts
	scene_script SSAnne2FRivalScene, SCENE_SS_ANNE_2F_RIVAL
	scene_script SSAnne2FNoopScene, SCENE_SS_ANNE_2F_NOOP
	
	def_callbacks

SSAnne2FRivalScene:
	end
	
SSAnne2FNoopScene:
	disappear SSANNE2F_RIVAL
	end

SSAnne2FWaiterScript:
	jumptextfaceplayer SSAnne2FWaiterText

SSAnneRivalBattleScript:
	playmusic MUSIC_MEET_RIVAL
	showemote EMOTE_SHOCK, PLAYER, 30
	readvar VAR_XCOORD
        getnum STRING_BUFFER_3
        ifequal 36, .RivalWalksToLeft
        ifequal 37, .RivalWalksToRight
	appear SSANNE2F_RIVAL
.RivalWalksToLeft
	applymovement SSANNE2F_RIVAL, .RivalWalksToLeftMov
	sjump .BTM1
.RivalWalksToRight
	applymovement SSANNE2F_RIVAL, .RivalWalksToRightMov
	turnobject PLAYER, LEFT
	turnobject SSANNE2F_RIVAL, RIGHT
.BTM1
	opentext
	writetext SSAnne2FRivalText
	waitbutton
	closetext
	setevent EVENT_S_S_ANNE_RIVAL_WANTS_BATTLE
	winlosstext SSAnne2FRivalDefeatedText, SSAnne2FRivalVictoryText
	checkevent EVENT_GOT_A_CHARMANDER_FROM_OAK
	iftrue .Wartotle
	checkevent EVENT_GOT_A_SQUIRTLE_FROM_OAK
	iftrue .Ivysaur
	loadtrainer BLUE2, BLUE4_CHARMELEON
	sjump .BTM2
.Ivysaur
	loadtrainer BLUE2, BLUE4_IVYSAUR
	sjump .BTM2
.Wartotle
	loadtrainer BLUE2, BLUE4_WARTOTLE
.BTM2
	startbattle
	reloadmapafterbattle
	opentext
	writetext SSAnne2FRivalCutMasterText
	waitbutton
	closetext
	playmusic MUSIC_MEET_RIVAL_ALT
	readvar VAR_XCOORD
        getnum STRING_BUFFER_3
        ifequal 36, .RivalLeavesFromLeft
        ifequal 37, .RivalLeavesFromRight
.RivalLeavesFromLeft
	applymovement SSANNE2F_RIVAL, .RivalLeavesLeftMov
	sjump .BTM3
.RivalLeavesFromRight
	applymovement SSANNE2F_RIVAL, .RivalLeavesRightMov
.BTM3
	disappear SSANNE2F_RIVAL
	special RestartMapMusic
	setevent EVENT_BEAT_RIVAL_S_S_ANNE
	setscene SCENE_SS_ANNE_2F_NOOP
	end

.RivalWalksToRightMov:
	slow_step DOWN
.RivalWalksToLeftMov:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
	
.RivalLeavesLeftMov:
	slow_step RIGHT
	slow_step DOWN
.RivalLeavesRightMov:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
	
SSAnne2FWaiterText:
	text "This ship, she is"
	line "a luxury liner"
	cont "for trainers!"

	para "At every port, we"
	line "hold parties with"
	cont "invited trainers!"
	done

SSAnne2FRivalText:
	text "<RIVAL>: Bonjour!"
	line "<PLAYER>!"

	para "Imagine seeing"
	line "you here!"

	para "<PLAYER>, were you"
	line "really invited?"

	para "So how's your"
	line "#DEX coming?"

	para "I already caught"
	line "40 kinds, pal!"

	para "Different kinds"
	line "are everywhere!"

	para "Crawl around in"
	line "grassy areas!"
	done

SSAnne2FRivalDefeatedText:
	text "Humph!"

	para "At least you're"
	line "raising your"
	cont "#MON!"
	prompt

SSAnne2FRivalVictoryText:
	text "<PLAYER>! What are"
	line "you, seasick?"

	para "You should shape"
	line "up, pal!"
	prompt

SSAnne2FRivalCutMasterText:
	text "<RIVAL>: I heard"
	line "there was a CUT"
	cont "master on board."

	para "But, he was just a"
	line "seasick, old man!"

	para "But, CUT itself is"
	line "really useful!"

	para "You should go see"
	line "him! Smell ya!"
	done
	
SSAnne2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, SS_ANNE_2F_ROOMS, 1
	warp_event 13, 11, SS_ANNE_2F_ROOMS, 3
	warp_event 17, 11, SS_ANNE_2F_ROOMS, 5
	warp_event 21, 11, SS_ANNE_2F_ROOMS, 7
	warp_event 25, 11, SS_ANNE_2F_ROOMS, 9
	warp_event 29, 11, SS_ANNE_2F_ROOMS, 11
	warp_event  2,  4, SS_ANNE_1F, 9
	warp_event  2, 12, SS_ANNE_3F, 2
	warp_event 36,  4, SS_ANNE_CAPTAINS_ROOM, 1

	def_coord_events
	coord_event  36,  8, SCENE_SS_ANNE_2F_RIVAL, SSAnneRivalBattleScript
	coord_event  37,  8, SCENE_SS_ANNE_2F_RIVAL, SSAnneRivalBattleScript
	def_bg_events

	def_object_events
	object_event  3,  7, SPRITE_WAITER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne2FWaiterScript, -1
    object_event 36,  4, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneRivalBattleScript, EVENT_S_S_ANNE_RIVAL_WANTS_BATTLE