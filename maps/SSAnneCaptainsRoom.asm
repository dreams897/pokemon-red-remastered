	object_const_def

SSAnneCaptainsRoom_MapScripts:
	def_scene_scripts

	def_callbacks

SSAnneCaptainsRoomSeasickBookScript:
	jumptext SSAnneCaptainsRoomSeasickBookText

SSAnneCaptainsRoomTrashScript:
	jumptext SSAnneCaptainsRoomTrashText

SSAnneCaptainScript:
	opentext
	checkevent EVENT_GOT_HM01
	iftrue .NotSick
	checkevent EVENT_RUBBED_CAPTAINS_BACK
	iftrue .NoLongerSick
	writetext SSAnneCaptainsRoomRubCaptainsBackText
	playmusic MUSIC_PKMN_HEALED
	pause 90
	special RestartMapMusic
	setevent EVENT_RUBBED_CAPTAINS_BACK
.NoLongerSick
	faceplayer
	writetext SSAnneCaptainsRoomCaptainIFeelMuchBetterText
	getitemname STRING_BUFFER_3, HM_CUT
	giveitem HM_CUT
	iffalse .NoRoom
	writetext SSAnneCaptainsRoomCaptainReceivedHM01Text
	playsound SFX_GET_KEY_ITEM_1
	waitsfx
	waitbutton
	setevent EVENT_GOT_HM01
	sjump .BTM
.NoRoom
	writetext SSAnneCaptainsRoomCaptainHM01NoRoomText
	waitbutton
	sjump .BTM
.NotSick
	faceplayer
	writetext SSAnneCaptainsRoomCaptainNotSickAnymoreText
	waitbutton
.BTM
	closetext
	end

SSAnneCaptainsRoomRubCaptainsBackText:
	text "CAPTAIN: Ooargh..."
	line "I feel hideous..."
	cont "Urrp! Seasick..."

	para "<PLAYER> rubbed"
	line "the CAPTAIN's"
	cont "back!"

	para "Rub-rub..."
	line "Rub-rub..."
	done

SSAnneCaptainsRoomCaptainIFeelMuchBetterText:
	text "CAPTAIN: Whew!"
	line "Thank you! I"
	cont "feel much better!"

	para "You want to see"
	line "my CUT technique?"

	para "I could show you"
	line "if I wasn't ill..."

	para "I know! You can"
	line "have this!"

	para "Teach it to your"
	line "#MON and you"
	cont "can see it CUT"
	cont "any time!"
	prompt

SSAnneCaptainsRoomCaptainReceivedHM01Text:
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer3
	text "!@"
	text_end

SSAnneCaptainsRoomCaptainNotSickAnymoreText:
	text "CAPTAIN: Whew!"

	para "Now that I'm not"
	line "sick any more, I"
	cont "guess it's time."
	done

SSAnneCaptainsRoomCaptainHM01NoRoomText:
	text "Oh no! You have"
	line "no room for this!"
	done

SSAnneCaptainsRoomTrashText:
	text "Yuck! Shouldn't"
	line "have looked!"
	done

SSAnneCaptainsRoomSeasickBookText:
	text "How to Conquer"
	line "Seasickness..."
	cont "The CAPTAIN's"
	cont "reading this!"
	done

SSAnneCaptainsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, SS_ANNE_2F, 9

	def_coord_events

	def_bg_events
	bg_event 4, 1, BGEVENT_READ, SSAnneCaptainsRoomTrashScript
	bg_event 1, 2, BGEVENT_READ, SSAnneCaptainsRoomSeasickBookScript

	def_object_events
	object_event  4,  2, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAnneCaptainScript, -1