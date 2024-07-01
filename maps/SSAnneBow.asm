	object_const_def

SSAnneBow_MapScripts:
	def_scene_scripts

	def_callbacks
	
SSAnneBowSuperNerdScript:
	jumptextfaceplayer SSAnneBowSuperNerdText
	
SSAnneBowSailor1Script:
	jumptextfaceplayer SSAnneBowSailor1Text

SSAnneBowCooltrainerMScript:
	jumptextfaceplayer SSAnneBowCooltrainerMText
	
TrainerSSAnneBowSailor2:
	trainer SAILOR, EDMOND2, EVENT_BEAT_SS_ANNE_EDMOND, SSAnneBowSailor2BattleText, SSAnneBowSailor2EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneBowSailor2AfterBattleText
	waitbutton
	closetext
	end

TrainerSSAnneBowSailor3:
	trainer SAILOR, TREVOR2, EVENT_BEAT_SS_ANNE_TREVOR, SSAnneBowSailor3BattleText, SSAnneBowSailor3EndBattleText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSAnneBowSailor3AfterBattleText
	waitbutton
	closetext
	end

SSAnneBowSuperNerdText:
	text "The party's over."
	line "The ship will be"
	cont "departing soon."
	done

SSAnneBowSailor1Text:
	text "Scrubbing decks"
	line "is hard work!"
	done

SSAnneBowCooltrainerMText:
	text "Urf. I feel ill."

	para "I stepped out to"
	line "get some air."
	done

SSAnneBowSailor2BattleText:
	text "Hey matey!"

	para "Let's do a little"
	line "jig!"
	done

SSAnneBowSailor2EndBattleText:
	text "You're impressive!"
	prompt

SSAnneBowSailor2AfterBattleText:
	text "How many kinds of"
	line "#MON do you"
	cont "think there are?"
	done

SSAnneBowSailor3BattleText:
	text "Ahoy there!"
	line "Are you seasick?"
	done

SSAnneBowSailor3EndBattleText:
	text "I was just care-"
	line "less!"
	prompt

SSAnneBowSailor3AfterBattleText:
	text "My Pa said there"
	line "are 100 kinds of"
	cont "#MON. I think"
	cont "there are more."
	done

	
SSAnneBow_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  6, SS_ANNE_3F, 1
	warp_event 13,  7, SS_ANNE_3F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowSuperNerdScript, -1
	object_event  4,  9, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowSailor1Script, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneBowCooltrainerMScript, -1
	object_event  4,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSSAnneBowSailor2, -1
	object_event 10,  8, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSSAnneBowSailor3, -1