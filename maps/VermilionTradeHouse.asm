	object_const_def
	const VERMILIONTRADEHOUSE_POKEFAN_F
	const VERMILIONTRADEHOUSE_YOUNGSTER

VermilionTradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionTradeHousePokefanFScript:
	faceplayer
	opentext
	trade NPC_TRADE_ELYSSA
	waitbutton
	closetext
	end

VermilionTradeHouseBookshelf:
	jumpstd PictureBookshelfScript

VermilionTradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 8
	warp_event  3,  7, VERMILION_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, VermilionTradeHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, VermilionTradeHouseBookshelf

	def_object_events
	object_event  3,  5, SPRITE_LITTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionTradeHousePokefanFScript, -1
