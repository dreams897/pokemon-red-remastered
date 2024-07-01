	object_const_def
	const ROUTE5SAFFRONGATE_OFFICER

Route5SaffronGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route5SaffronGateOfficerScript:
	end

Route5SaffronGateGuardDrinkTalkScript:
	checkevent EVENT_GAVE_SAFFRON_GUARD_A_DRINK
	iftrue .ThanksForTheDrinks
	sjump Route5SaffronGateGuardDrinkScript
.ThanksForTheDrinks:
	opentext
	farwritetext _SaffronGateGuardThanksForTheDrinkText
	waitbutton
	closetext
	end
	
Route5SaffronGateGuardDrinkScript:
	checkevent EVENT_GAVE_SAFFRON_GUARD_A_DRINK
	iftrue .ScriptEnd
	turnobject PLAYER, LEFT ;make player face the guard
	callstd ThirstySaffronGuards_DrinkScript
	checkevent EVENT_GAVE_SAFFRON_GUARD_A_DRINK
	iftrue .ScriptEnd
	applymovement PLAYER, .SaffronPushAway
.ScriptEnd
	end

.SaffronPushAway
	step UP
	step_end
	
Route5SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, ROUTE_5, 2
	warp_event  4,  0, ROUTE_5, 3
	warp_event  3,  5, SAFFRON_CITY, 9
	warp_event  4,  5, SAFFRON_CITY, 9

	def_coord_events
	coord_event  3,  3, -1, Route5SaffronGateGuardDrinkScript
	coord_event  4,  3, -1, Route5SaffronGateGuardDrinkScript
	def_bg_events
	bg_event  2,  3, BGEVENT_LEFT, Route5SaffronGateGuardDrinkTalkScript
	def_object_events
	object_event  1,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SaffronGateOfficerScript, -1
