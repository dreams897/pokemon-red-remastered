	object_const_def
	const SSANNE1F_WAITER
	const SSANNE1F_SAILOR

SSAnne1F_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnne1FWaiterScript:
	jumptextfaceplayer SSAnne1FWaiterText

SSAnne1FSailorScript:
	jumptextfaceplayer SSAnne1FSailorText

SSAnne1FWaiterText:
	text "Bonjour!"
	line "I am le waiter on"
	cont "this ship!"

	para "I will be happy"
	line "to serve you any-"
	cont "thing you please!"

	para "Ah! Le strong"
	line "silent type!"
	done

SSAnne1FSailorText:
	text "The passengers"
	line "are restless!"

	para "You might be"
	line "challenged by the"
	cont "more bored ones!"
	done
	
	
SSAnne1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  0, VERMILION_DOCK, 2
	warp_event 27,  0, VERMILION_DOCK, 2
	warp_event 31,  8, SS_ANNE_1F_ROOMS, 1
	warp_event 23,  8, SS_ANNE_1F_ROOMS, 2
	warp_event 19,  8, SS_ANNE_1F_ROOMS, 3
	warp_event 15,  8, SS_ANNE_1F_ROOMS, 4
	warp_event 11,  8, SS_ANNE_1F_ROOMS, 5
	warp_event  7,  8, SS_ANNE_1F_ROOMS, 6
	warp_event  2,  6, SS_ANNE_2F, 7
	warp_event 37, 15, SS_ANNE_B1F, 6
	warp_event  3, 16, SS_ANNE_KITCHEN, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  6, SPRITE_WAITER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 4, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FWaiterScript, -1
	object_event 27,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne1FSailorScript, -1