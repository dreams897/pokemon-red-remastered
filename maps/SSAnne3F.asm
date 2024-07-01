	object_const_def

SSAnne3F_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnne3FSailorScript:
	jumptextfaceplayer SSAnne3FSailorText

SSAnne3FSailorText:
	text "Our CAPTAIN is a"
	line "sword master!"

	para "He even teaches"
	line "CUT to #MON!"
	done

SSAnne3F_MapEvents:
	db 0, 0 ; filler
	def_warp_events
	warp_event  0,  3, SS_ANNE_BOW, 1
	warp_event 19,  3, SS_ANNE_2F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 4, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnne3FSailorScript, -1