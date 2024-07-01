RedsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsHouse2FSNESScript:
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	giveitem TOWN_MAP
	giveitem LEMONADE
	giveitem S_S_TICKET
	givepoke GYARADOS, 80
	givepoke BULBASAUR, 5
	jumptext RedsHouse2FSNESText

RedsHouse2FSNESText:
	text "<PLAYER> is"
	line "playing the SNES!"
	cont "... Okay!"
	cont "It's time to go!"
	done
	
RedsHouse2FPCText:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  1, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  5, BGEVENT_READ, RedsHouse2FSNESScript
	bg_event  0,  1, BGEVENT_UP, RedsHouse2FPCText

	def_object_events
