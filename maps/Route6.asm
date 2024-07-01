	object_const_def
	const ROUTE6_KEIGO
	const ROUTE6_RICKY
	const ROUTE6_NANCY

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBugCatcherKeigo:
	trainer BUG_CATCHER, KEIGO, EVENT_BEAT_ROUTE_6_KEIGO, Route6Youngster1BattleText, Route6Youngster1EndBattleText, 0, .Script
	
.Script
	endifjustbattled
	opentext
	writetext Route6Youngster1AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherElijah:
	trainer BUG_CATCHER, ELIJAH, EVENT_BEAT_ROUTE_6_ELIJAH, Route6Youngster2BattleText, Route6Youngster2EndBattleText, 0, .Script
	
.Script
	endifjustbattled
	opentext
	writetext Route6Youngster2AfterBattleText
	waitbutton
	closetext
	end

TrainerJrTrainerJeff:
	trainer JRTRAINER_M, JEFF2, EVENT_BEAT_ROUTE_6_JEFF, Route6CooltrainerM2BattleText, Route6CooltrainerM2EndBattleText, 0, .Script
	
.Script
	endifjustbattled
	opentext
	writetext Route6CooltrainerM2AfterBattleText
	waitbutton
	closetext
	end

TrainerJrTrainerIsabelle:
	trainer JRTRAINER_F, ISABELLE, EVENT_BEAT_ROUTE_6_ISABELLE, Route6CooltrainerF2BattleText, Route6CooltrainerF2EndBattleText, 0, .Script
	
.Script
	endifjustbattled
	opentext
	writetext Route6CooltrainerF2AfterBattleText
	waitbutton
	closetext
	end

JrTrainerRickyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ROUTE_6_RICKY
	iftrue .PostBattle
	writetext Route6CooltrainerM1BattleText
	playmusic MUSIC_MEET_MALE_TRAINER
	waitbutton
	winlosstext Route6CooltrainerM1EndBattleText, 0
	loadtrainer JRTRAINER_M, RICKY2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_6_RICKY
	end
.PostBattle
	writetext Route6CooltrainerAfterBattleText
	waitbutton
	closetext
	end

JrTrainerNancyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ROUTE_6_NANCY
	iftrue .PostBattle
	writetext Route6CooltrainerF1BattleText
	playmusic MUSIC_MEET_FEMALE_TRAINER
	waitbutton
	winlosstext Route6CooltrainerF1EndBattleText, 0
	loadtrainer JRTRAINER_F, NANCY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_6_NANCY
	end
.PostBattle
	writetext Route6CooltrainerAfterBattleText
	waitbutton
	closetext
	end

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

Route6CooltrainerM1BattleText:
	text "Who's there?"
	line "Quit listening in"
	cont "on us!"
	done

Route6CooltrainerM1EndBattleText:
	text "I just can't win!"
	prompt

Route6CooltrainerAfterBattleText:
	text "Whisper..."
	line "whisper..."
	done

Route6CooltrainerF1BattleText:
	text "Excuse me! This"
	line "is a private"
	cont "conversation!"
	done

Route6CooltrainerF1EndBattleText:
	text "Ugh!"
	line "I hate losing!"
	prompt

Route6Youngster1BattleText:
	text "There aren't many"
	line "bugs out here."
	done

Route6Youngster1EndBattleText:
	text "No!"
	line "You're kidding!"
	prompt

Route6Youngster1AfterBattleText:
	text "I like bugs, so"
	line "I'm going back to"
	cont "VIRIDIAN FOREST."
	done

Route6CooltrainerM2BattleText:
	text "Huh? You want"
	line "to talk to me?"
	done

Route6CooltrainerM2EndBattleText:
	text "I didn't start it!"
	prompt

Route6CooltrainerM2AfterBattleText:
	text "I should carry"
	line "more #MON with"
	cont "me for safety."
	done

Route6CooltrainerF2BattleText:
	text "Me? Well, OK."
	line "I'll play!"
	done

Route6CooltrainerF2EndBattleText:
	text "Just didn't work!"
	prompt

Route6CooltrainerF2AfterBattleText:
	text "I want to get"
	line "stronger! What's"
	cont "your secret?"
	done

Route6Youngster2BattleText:
	text "I've never seen"
	line "you around!"
	cont "Are you good?"
	done

Route6Youngster2EndBattleText:
	text "You are too good!"
	prompt

Route6Youngster2AfterBattleText:
	text "Are my #MON"
	line "weak? Or, am I"
	cont "just bad?"
	done


Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 13, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 10,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 19, 15, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event  0, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherKeigo, -1
	object_event 10, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, JrTrainerRickyScript, -1
	object_event 11, 21, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, JrTrainerNancyScript, -1
	object_event 19, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherElijah, -1
	object_event 11, 31, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerJrTrainerJeff, -1
	object_event 11, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerJrTrainerIsabelle, -1
