	object_const_def
	const VERMILIONCITY_BEAUTY
	const VERMILIONCITY_GAMBLER1
	const VERMILIONCITY_SAILOR1
	const VERMILIONCITY_GAMBLER2
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SAILOR2

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VermilionCityFlypointCallback

VermilionCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityBeautyScript:
	jumptextfaceplayer VermilionCityBeautyText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end
	
VermillionGambler1:
	faceplayer
	opentext
	checkevent EVENT_SS_ANNE_LEFT
	iftrue .ShipLeft
	writetext VermilionCityGambler1DidYouSeeText
	sjump .btm
.ShipLeft
	writetext VermilionCityGambler1SSAnneDepartedText
.btm
	waitbutton
	closetext
	end

VermillionSailor2:
	jumptextfaceplayer VermilionCitySailor2Text

VermillionSailor1:
	readvar VAR_FACING
	ifequal UP, .end
	turnobject VERMILIONCITY_SAILOR1, VAR_FACING
	opentext 
	checkevent EVENT_SS_ANNE_LEFT
	iftrue .Departed
	writetext VermilionCitySailor1WelcomeToSSAnneText
	waitbutton
	readvar VAR_XCOORD
    getnum STRING_BUFFER_3
    ifequal 18, .CheckForTicket
	closetext
	end
.CheckForTicket
	writetext VermilionCitySailor1DoYouHaveATicketText
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext VermilionCitySailor1FlashedTicketText
	waitbutton
	closetext
	end
.NoTicket
	writetext VermilionCitySailor1YouNeedATicketText
	waitbutton
	closetext
	applymovement PLAYER, .MoveUp
	end
.Departed
	writetext VermilionCitySailor1ShipSetSailText
	waitbutton
	closetext
	applymovement PLAYER, .MoveUp
.end
	end

.MoveUp
	step UP
	step_end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityPortSign:
	jumptext VermilionCityHarborSignText

VermilionCityNoticeSign:
	jumptext VermilionCityNoticeSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityBeautyText:
	text "We're careful"
	line "about pollution!"

	para "We've heard GRIMER"
	line "multiplies in"
	cont "toxic sludge!"
	done

VermilionCityGambler1DidYouSeeText:
	text "Did you see S.S."
	line "ANNE moored in"
	cont "the harbor?"
	done

VermilionCityGambler1SSAnneDepartedText:
	text "So, S.S.ANNE has"
	line "departed!"

	para "She'll be back in"
	line "about a year."
	done

VermilionCitySailor1WelcomeToSSAnneText:
	text "Welcome to S.S."
	line "ANNE!"
	done

VermilionCitySailor1DoYouHaveATicketText:
	text "Excuse me, do you"
	line "have a ticket?"
	prompt

VermilionCitySailor1FlashedTicketText:
	text "<PLAYER> flashed"
	line "the S.S.TICKET!"

	para "Great! Welcome to"
	line "S.S.ANNE!"
	done

VermilionCitySailor1YouNeedATicketText:
	text "<PLAYER> doesn't"
	line "have the needed"
	cont "S.S.TICKET."

	para "Sorry!"

	para "You need a ticket"
	line "to get aboard."
	done

VermilionCitySailor1ShipSetSailText:
	text "The ship set sail."
	done

VermilionMachopOwnerText:
	text "I'm putting up a"
	line "building on this"
	cont "plot of land."

	para "My #MON is"
	line "tamping the land."
	done

VermilionMachopText1:
	text "MACHOP: Guoh!"
	line "Gogogoh!"
	done

VermilionMachopText2:
	text "A MACHOP is"
	line "stomping the land"
	cont "flat."
	done

VermilionCitySailor2Text:
	text "S.S.ANNE is a"
	line "famous luxury"
	cont "cruise ship."

	para "We visit VERMILION"
	line "once a year."
	done

VermilionCitySignText:
	text "VERMILION CITY"
	line "The Port of"
	cont "Exquisite Sunsets"
	done

VermilionCityNoticeSignText:
	text "NOTICE!"

	para "ROUTE 12 may be"
	line "blocked off by a"
	cont "sleeping #MON."

	para "Detour through"
	line "ROCK TUNNEL to"
	cont "LAVENDER TOWN."

	para "VERMILION POLICE"
	done

PokemonFanClubSignText:
	text "#MON FAN CLUB"
	line "All #MON fans"
	cont "welcome!"
	done

VermilionGymSignText:
	text "VERMILION CITY"
	line "#MON GYM"
	cont "LEADER: LT.SURGE"

	para "The Lightning "
	line "American!"
	done

VermilionCityHarborSignText:
	text "VERMILION HARBOR"
	done


VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  3, VERMILION_POKECENTER_1F, 1
	warp_event  9, 13, POKEMON_FAN_CLUB, 1
	warp_event 23, 13, VERMILION_MART, 1
	warp_event 12, 19, VERMILION_GYM, 1
	warp_event 23, 19, VERMILION_PIDGEY_HOUSE, 1
	warp_event 18, 31, VERMILION_DOCK, 1
	warp_event 19, 31, VERMILION_DOCK, 1
	warp_event 15, 13, VERMILION_TRADE_HOUSE, 1
	warp_event  7,  3, VERMILION_FISHING_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 18, 30, -1, VermillionSailor1

	def_bg_events
	bg_event 27,  3, BGEVENT_READ, VermilionCitySign
	bg_event  7, 19, BGEVENT_READ, VermilionGymSign
	bg_event  7, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 29, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 12,  3, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 24, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 37, 13, BGEVENT_READ, VermilionCityNoticeSign

	def_object_events
	object_event 19,  7, SPRITE_BEAUTY,  SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityBeautyScript, -1
	object_event 14,  6, SPRITE_GAMBLER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermillionGambler1, -1
	object_event 19, 30, SPRITE_SAILOR,  SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermillionSailor1, -1
	object_event 30,  7, SPRITE_GAMBLER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 29,  9, SPRITE_MACHOP,  SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 25, 27, SPRITE_SAILOR,  SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermillionSailor2, -1
