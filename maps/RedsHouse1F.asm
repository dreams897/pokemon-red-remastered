	object_const_def
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_FOLLOWED_OAK_INTO_LAB
	iftrue .Heal
	readvar VAR_PLAYERGENDER
	ifequal FEMALE, .AllGirlsLeaveSomeday
	ifequal ENBY, .EveryoneLeavesSomeday
	writetext MomWakeUpTextBoy
	waitbutton
	closetext
	end
	
.AllGirlsLeaveSomeday
	writetext MomWakeUpTextGirl
	waitbutton
	closetext
	end
	
.EveryoneLeavesSomeday
	writetext MomWakeUpTextEnby
	waitbutton
	closetext
	end
	
.Heal:
	writetext RedsHouse1FMomYouShouldRestText
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_PKMN_HEALED
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext RedsHouse1FMomLookingGreatText
	waitbutton
	closetext
	end

RedsHouse1FTV:
	readvar VAR_PLAYERGENDER
	ifequal FEMALE, .GirlWizardOfOzMovie
	ifequal ENBY, .EnbyVictorVictoriaMovie
	jumptext StandByMeText
	
.EnbyVictorVictoriaMovie
	jumptext VictorVictoriaText
.GirlWizardOfOzMovie
	jumptext WizardOfOzText

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsHouse1FWrongSide:
	jumptext RedsHouse1FTVWrongSideText
	
MomWakeUpTextBoy:
	text "MOM: Right."
	line "All boys leave"
	cont "home some day."
	cont "It said so on TV."

	para "PROF.OAK, next"
	line "door, is looking"
	cont "for you."
	done
	
MomWakeUpTextGirl:
	text "Mom: Right."
	line "All girls leave"
	cont "home some day."
	cont "It said so on TV."

	para "Prof. Oak, next"
	line "door, is looking"
	cont "for you."
	done
	
MomWakeUpTextEnby:
	text "Mom: Right."
	line "Everyone leaves"
	cont "home some day."
	cont "It said so on TV."

	para "Prof. Oak, next"
	line "door, is looking"
	cont "for you."
	done
	
StandByMeText:
	text "There's a movie"
	line "on TV. Four boys"
	cont "are walking on"
	cont "railroad tracks."

	para "I better go too."
	done
	
WizardOfOzText:
	text "There's a movie"
	line "on TV. A girl with"
	cont "her hair in pig-"
	cont "tails is walking"
	cont "up a brick road."

	para "I better go too."
	done
	
VictorVictoriaText:
	text "There's a movie"
	line "on TV. A singer"
	cont "with half-face"
	cont "makeup bows and"
	cont "exits the stage."

	para "I better go too."
	done
	
RedsHouse1FMomYouShouldRestText:
	text "MOM: <PLAYER>!"
	line "You should take a"
	cont "quick rest."
	prompt

RedsHouse1FMomLookingGreatText:
	text "MOM: Oh good!"
	line "You and your"
	cont "#MON are"
	cont "looking great!"
	cont "Take care now!"
	done
	
RedsHouse1FTVWrongSideText:
	text "Oops, wrong side."
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1
	warp_event  7,  1, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  3,  1, BGEVENT_UP, RedsHouse1FTV
	bg_event  3,  1, BGEVENT_LEFT, RedsHouse1FWrongSide
	bg_event  3,  1, BGEVENT_RIGHT, RedsHouse1FWrongSide

	def_object_events
	object_event  5,  4, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
