IrwinRumorScript:
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .MtSilver
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .Snorlax
	checkflag ENGINE_MARSHBADGE
	iftrue .MarshBadge
	checkflag ENGINE_FLYPOINT_VERMILION
	iftrue .VermilionCity
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .EliteFour
	checkflag ENGINE_RISINGBADGE
	iftrue .RisingBadge
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RadioTower
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .RocketHideout
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	checkflag ENGINE_FOGBADGE
	iftrue .FogBadge
	checkflag ENGINE_PLAINBADGE
	iftrue .PlainBadge
	farwritetext IrwinCalledRightAwayText
	promptbutton
	sjump PagerScript_HangUpText_Male

.PlainBadge:
	farwritetext IrwinPlainBadgeGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.JasmineReturned:
	farwritetext IrwinJasmineReturnedGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.RocketHideout:
	farwritetext IrwinRocketHideoutGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.RadioTower:
	farwritetext IrwinRadioTowerGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.RisingBadge:
	farwritetext IrwinRisingBadgeGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.EliteFour:
	farwritetext IrwinEliteFourGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.VermilionCity:
	farwritetext IrwinVermilionCityGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.Snorlax:
	farwritetext IrwinSnorlaxGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.MtSilver:
	farwritetext IrwinMtSilverGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.FogBadge:
	farwritetext IrwinFogBadgeGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male

.MarshBadge:
	farwritetext IrwinMarshBadgeGossipText
	promptbutton
	sjump PagerScript_HangUpText_Male
