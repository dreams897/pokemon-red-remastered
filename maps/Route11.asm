	object_const_def
	const ROUTE11_GAMBLER1
	const ROUTE11_GAMBLER2
	const ROUTE11_YOUNGSTER1
	const ROUTE11_SUPER_NERD1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_GAMBLER3
	const ROUTE11_GAMBLER4
	const ROUTE11_YOUNGSTER3
	const ROUTE11_SUPER_NERD2
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerR11Youngster1:
	trainer YOUNGSTER, EDDIE2, EVENT_BEAT_ROUTE_11_YOUNGSTER1, Route11Youngster1BattleText, Route11Youngster1EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11Youngster1AfterBattleText
	waitbutton
	closetext
	end

TrainerR11Youngster2:
	trainer YOUNGSTER, DILLON, EVENT_BEAT_ROUTE_11_YOUNGSTER2, Route11Youngster2BattleText, Route11Youngster2EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11Youngster2AfterBattleText
	waitbutton
	closetext
	end

TrainerR11Youngster3:
	trainer YOUNGSTER, YASU, EVENT_BEAT_ROUTE_11_YOUNGSTER3, Route11Youngster3BattleText, Route11Youngster3EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11Youngster3AfterBattleText
	waitbutton
	closetext
	end

TrainerR11Youngster4:
	trainer YOUNGSTER, DAVE2, EVENT_BEAT_ROUTE_11_YOUNGSTER4, Route11Youngster4BattleText, Route11Youngster4EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11Youngster4AfterBattleText
	waitbutton
	closetext
	end

TrainerR11Gambler1:
	trainer GAMBLER, HUGO, EVENT_BEAT_ROUTE_11_GAMBLER1, Route11Gambler1BattleText, Route11Gambler1EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11Gambler1AfterBattleText
	waitbutton
	closetext
	end

TrainerR11Gambler2:
	trainer GAMBLER, JASPER, EVENT_BEAT_ROUTE_11_GAMBLER2, Route11Gambler2BattleText, Route11Gambler2EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11Gambler2AfterBattleText
	waitbutton
	closetext
	end

TrainerR11Gambler3:
	trainer GAMBLER, DIRK2, EVENT_BEAT_ROUTE_11_GAMBLER3, Route11Gambler3BattleText, Route11Gambler3EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11Gambler3AfterBattleText
	waitbutton
	closetext
	end

TrainerR11Gambler4:
	trainer GAMBLER, DARIAN, EVENT_BEAT_ROUTE_11_GAMBLER4, Route11Gambler4BattleText, Route11Gambler4EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11Gambler4AfterBattleText
	waitbutton
	closetext
	end

TrainerR11SuperNerd1:
	trainer ENGINEER, BRAXTON, EVENT_BEAT_ROUTE_11_ENGINEER1, Route11SuperNerd1BattleText, Route11SuperNerd1EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11SuperNerd1AfterBattleText
	waitbutton
	closetext
	end

TrainerR11SuperNerd2:
	trainer ENGINEER, BERNIE, EVENT_BEAT_ROUTE_11_ENGINEER2, Route11SuperNerd2BattleText, Route11SuperNerd2EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route11SuperNerd2AfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText
	
DiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

Route11Gambler1BattleText:
	text "Win, lose or draw!"
	done

Route11Gambler1EndBattleText:
	text "Atcha!"
	line "Didn't go my way!"
	prompt

Route11Gambler1AfterBattleText:
	text "#MON is life!"
	line "And to live is to"
	cont "gamble!"
	done

Route11Gambler2BattleText:
	text "Competition! I"
	line "can't get enough!"
	done

Route11Gambler2EndBattleText:
	text "I had a chance!"
	prompt

Route11Gambler2AfterBattleText:
	text "You can't be a"
	line "coward in the"
	cont "world of #MON!"
	done

Route11Youngster1BattleText:
	text "Let's go, but"
	line "don't cheat!"
	done

Route11Youngster1EndBattleText:
	text "Huh?"
	line "That's not right!"
	prompt

Route11Youngster1AfterBattleText:
	text "I did my best! I"
	line "have no regrets!"
	done

Route11SuperNerd1BattleText:
	text "Careful!"
	line "I'm laying down"
	cont "some cables!"
	done

Route11SuperNerd1EndBattleText:
	text "That was electric!"
	prompt

Route11SuperNerd1AfterBattleText:
	text "Spread the word"
	line "to save energy!"
	done

Route11Youngster2BattleText:
	text "I just became a"
	line "trainer! But, I"
	cont "think I can win!"
	done

Route11Youngster2EndBattleText:
	text "My #MON"
	line "couldn't!"
	prompt

Route11Youngster2AfterBattleText:
	text "What do you want?"
	line "Leave me alone!"
	done

Route11Gambler3BattleText:
	text "Fwahaha! I have"
	line "never lost!"
	done

Route11Gambler3EndBattleText:
	text "My first loss!"
	prompt

Route11Gambler3AfterBattleText:
	text "Luck of the draw!"
	line "Just luck!"
	done

Route11Gambler4BattleText:
	text "I have never won"
	line "before..."
	done

Route11Gambler4EndBattleText:
	text "I saw this"
	line "coming..."
	prompt

Route11Gambler4AfterBattleText:
	text "It's just luck."
	line "Luck of the draw."
	done

Route11Youngster3BattleText:
	text "I'm the best in"
	line "my class!"
	done

Route11Youngster3EndBattleText:
	text "Darn!"
	line "I need to make my"
	cont "#MON stronger!"
	prompt

Route11Youngster3AfterBattleText:
	text "There's a fat"
	line "#MON that"
	cont "comes down from"
	cont "the mountains."

	para "It's strong if"
	line "you can get it."
	done

Route11SuperNerd2BattleText:
	text "Watch out for"
	line "live wires!"
	done

Route11SuperNerd2EndBattleText:
	text "Whoa!"
	line "You spark plug!"
	prompt

Route11SuperNerd2AfterBattleText:
	text "Well, better get"
	line "back to work."
	done

Route11Youngster4BattleText:
	text "My #MON should"
	line "be ready by now!"
	done

Route11Youngster4EndBattleText:
	text "Too much, too"
	line "young!"
	prompt

Route11Youngster4AfterBattleText:
	text "I better go find"
	line "stronger ones!"
	done

Route11SignText:
	text "ROUTE 11"
	done
	
VermilionCityDiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 49,  8, ROUTE_11_GATE_1F, 1
	warp_event 49,  9, ROUTE_11_GATE_1F, 2
	warp_event 58,  8, ROUTE_11_GATE_1F, 3
	warp_event 58,  9, ROUTE_11_GATE_1F, 4
	warp_event  4,  5, DIGLETTS_CAVE_ROUTE_11, 1

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 48,  5, BGEVENT_ITEM, Route11HiddenRevive
	bg_event  1,  5, BGEVENT_READ, DiglettsCaveSign

	def_object_events
	object_event 10, 14, SPRITE_GAMBLER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerR11Gambler1, -1
	object_event 26,  9, SPRITE_GAMBLER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerR11Gambler2, -1
	object_event 13,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerR11Youngster1, -1
	object_event 36, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerR11SuperNerd1, -1
	object_event 22,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerR11Youngster2, -1
	object_event 45,  7, SPRITE_GAMBLER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerR11Gambler3, -1
	object_event 33,  3, SPRITE_GAMBLER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerR11Gambler4, -1
	object_event 43,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerR11Youngster3, -1
	object_event 45, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerR11SuperNerd2, -1
	object_event 22, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerR11Youngster4, -1
	object_event 51,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
