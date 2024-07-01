DEF CERULEAN_BIKE_SHOP_BIKE EQU 1000000
	
	object_const_def
	const CERULEAN_BIKE_SHOP_CLERK
	const CERULEAN_BIKE_SHOP_MIDDLE_AGED_WOMAN
	const CERULEAN_BIKE_SHOP_YOUNGSTER
	

CeruleanBikeShop_MapScripts:
	def_scene_scripts

	def_callbacks
	
CerulanBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .HowDoYouLikeIt
	checkitem BIKE_VOUCHER
	iftrue .OhThatsABikeVoucher
	writetext BikeShopClerkWelcomeText
	loadmenu CeruleanBikeShop_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .TryToBuyBicycle
	sjump CeruleanBikeShop_CancelPurchaseScript
	
.TryToBuyBicycle:
	checkmoney YOUR_MONEY, CERULEAN_BIKE_SHOP_BIKE
	ifequal HAVE_LESS, .NotEnoughMoney
	getitemname STRING_BUFFER_3, BICYCLE
	scall CeruleanBikeShop_askbuy
	iffalse CeruleanBikeShop_CancelPurchaseScript
	end
	
.OhThatsABikeVoucher
	writetext BikeShopClerkOhThatsAVoucherText
	giveitem BICYCLE
	iffalse .NoRoom
	takeitem BIKE_VOUCHER
	writetext BikeShopExchangedVoucherText
	setevent EVENT_GOT_BICYCLE
	playsound SFX_GET_KEY_ITEM_1
	waitsfx
	waitbutton
	closetext
	end
	
.NotEnoughMoney
	writetext BikeShopCantAffordText
	closetext
	end
	
.NoRoom
	writetext BikeShopBagFullText
	waitbutton
	closetext
	end
	
.HowDoYouLikeIt
	writetext BikeShopClerkHowDoYouLikeYourBicycleText
	waitbutton
	closetext
	end
	
CeruleanBikeShop_CancelPurchaseScript:
	closetext
	end
	
CeruleanBikeShop_askbuy:
	writetext BikeShopClerkDoYouWantItText
	yesorno
	end
	
CeruleanBikeShop_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, TEXTBOX_Y - 6
	dw .MenuData
	db 1 ; default option
	
.MenuData:
	db STATICMENU_CURSOR ; flags
	db 2 ; items
	db "BICYCLE  ¥1000000@"
	db "CANCEL@"
	
CeruleanBikeShopMiddleAgedWomanScript:
	faceplayer
	opentext
	writetext BikeShopMiddleAgedWomanText
	waitbutton
	closetext
	end
	
CeruleanBikeShopYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .WowYourBikeIsCool
	iffalse .TheseBikesAreExpensive
	
.WowYourBikeIsCool
	writetext BikeShopYoungsterCoolBikeText
	waitbutton
	closetext
	end

.TheseBikesAreExpensive
	writetext BikeShopYoungsterTheseBikesAreExpensiveText
	waitbutton
	closetext
	end
	
ShinyNewBicycle:
	jumptext NewBicycleText
	
BikeShopClerkWelcomeText:
	text "Hi! Welcome to"
	line "our BIKE SHOP."

	para "Have we got just"
	line "the BIKE for you!"
	done

BikeShopClerkDoYouWantItText:
	text "It's a cool BIKE!"
	line "Do you want it?"
	done

BikeShopCantAffordText:
	text "Sorry! You can't"
	line "afford it!"
	prompt

BikeShopClerkOhThatsAVoucherText:
	text "Oh, that's..."

	para "A BIKE VOUCHER!"

	para "OK! Here you go!"
	prompt

BikeShopExchangedVoucherText:
	text "<PLAYER> exchanged"
	line "the BIKE VOUCHER"
	cont "for a BICYCLE."
	done

BikeShopComeAgainText:
	text "Come back again"
	line "some time!"
	done

BikeShopClerkHowDoYouLikeYourBicycleText:
	text "How do you like"
	line "your new BICYCLE?"

	para "You can take it"
	line "on CYCLING ROAD"
	cont "and in caves!"
	done

BikeShopBagFullText:
	text "You better make"
	line "room for this!"
	done

BikeShopMiddleAgedWomanText:
	text "A plain city BIKE"
	line "is good enough"
	cont "for me!"

	para "You can't put a"
	line "shopping basket"
	cont "on an MTB!"
	done

BikeShopYoungsterTheseBikesAreExpensiveText:
	text "These BIKEs are"
	line "cool, but they're"
	cont "way expensive!"
	done

BikeShopYoungsterCoolBikeText:
	text "Wow. Your BIKE is"
	line "really cool!"
	done
	
NewBicycleText:
	text "A shiny new"
	line "BICYCLE!"
	done

CeruleanBikeShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 8
	warp_event  3,  7, CERULEAN_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  0,  5, BGEVENT_READ, ShinyNewBicycle
	bg_event  1,  5, BGEVENT_READ, ShinyNewBicycle
	bg_event  1,  4, BGEVENT_READ, ShinyNewBicycle
	bg_event  2,  2, BGEVENT_READ, ShinyNewBicycle
	bg_event  3,  2, BGEVENT_READ, ShinyNewBicycle
	bg_event  3,  1, BGEVENT_READ, ShinyNewBicycle
	bg_event  4,  0, BGEVENT_READ, ShinyNewBicycle

	def_object_events
	object_event  6,  2, SPRITE_BIKE_SHOP_CLERK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CerulanBikeShopClerkScript, -1
	object_event  5,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopMiddleAgedWomanScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopYoungsterScript, -1
	

