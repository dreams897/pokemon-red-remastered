	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .HowAreTheFish
	writetext VermilionOldRodHouseFishingGuruDoYouLikeToFishText
	yesorno
	iftrue .Grand
	writetext VermilionOldRodHouseFishingGuruThatsSoDisappointingText
	sjump .btm
.Grand
	writetext VermilionOldRodHouseFishingGuruTakeThisText
	getitemname STRING_BUFFER_3, OLD_ROD
	giveitem OLD_ROD
	iffalse .NoRoom
	writetext OldRodReceived
	playsound SFX_GET_ITEM1_1
	waitsfx
	waitbutton
	setevent EVENT_GOT_OLD_ROD
	writetext VermilionOldRodHouseFishingGuruFishingIsAWayOfLifeText
	sjump .btm
.NoRoom
	writetext VermilionOldRodHouseFishingGuruNoRoomText
	sjump .btm
.HowAreTheFish
	writetext VermilionOldRodHouseFishingGuruHowAreTheFishBitingText
.btm
	waitbutton
	closetext
	end

VermilionOldRodHouseFishingGuruDoYouLikeToFishText:
	text "I'm the FISHING"
	line "GURU!"

	para "I simply Looove"
	line "fishing!"

	para "Do you like to"
	line "fish?"
	done

VermilionOldRodHouseFishingGuruTakeThisText:
	text "Grand! I like"
	line "your style!"

	para "Take this and"
	line "fish, young one!"
	prompt

OldRodReceived:
	text "<PLAYER> received"
	line "an @"
	text_ram wStringBuffer3
	text "!@"
	text_end

VermilionOldRodHouseFishingGuruFishingIsAWayOfLifeText:
	text "Fishing is a way"
	line "of life!"

	para "From the seas to"
	line "rivers, go out"
	cont "and land the big"
	cont "one, young one!"
	done

VermilionOldRodHouseFishingGuruThatsSoDisappointingText:
	text "Oh... That's so"
	line "disappointing..."
	done

VermilionOldRodHouseFishingGuruHowAreTheFishBitingText:
	text "Hello there,"
	line "<PLAYER>!"

	para "How are the fish"
	line "biting?"
	done

VermilionOldRodHouseFishingGuruNoRoomText:
	text "Oh no!"

	para "You have no room"
	line "for my gift!"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 9
	warp_event  3,  7, VERMILION_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
