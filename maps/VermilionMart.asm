	object_const_def
	const VERMILIONMART_CLERK
	const VERMILIONMART_SUPER_NERD
	const VERMILIONMART_BEAUTY

VermilionMart_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VERMILION
	closetext
	end

VermilionMartSuperNerdScript:
	jumptextfaceplayer VermilionMartSuperNerdText

VermilionMartBeautyScript:
	jumptextfaceplayer VermilionMartBeautyText

VermilionMartSuperNerdText:
	text "There are evil"
	line "people who will"
	cont "use #MON for"
	cont "criminal acts."

	para "TEAM ROCKET"
	line "traffics in rare"
	cont "#MON."

	para "They also abandon"
	line "#MON that they"
	cont "consider not to"
	cont "be popular or"
	cont "useful."
	done

VermilionMartBeautyText:
	text "I think #MON"
	line "can be good or"
	cont "evil. It depends"
	cont "on the trainer."
	done

VermilionMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VERMILION_CITY, 3
	warp_event  4,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMartClerkScript, -1
	object_event  5,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionMartSuperNerdScript, -1
	object_event  3,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionMartBeautyScript, -1
