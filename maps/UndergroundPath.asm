UndergroundPath_MapScripts:
	def_scene_scripts

	def_callbacks

UndergroundPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE

UndergroundPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_UNDERGROUND_PATH_HIDDEN_X_SPECIAL

UndergroundPath_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  4, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  2, 41, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 3

	def_coord_events

	def_bg_events
	bg_event  3,  4, BGEVENT_ITEM, UndergroundPathHiddenFullRestore
	bg_event  4, 34, BGEVENT_ITEM, UndergroundPathHiddenXSpecial

	def_object_events
