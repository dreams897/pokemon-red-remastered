; What music plays when a trainer notices you

TrainerEncounterMusic::
; entries correspond to trainer classes (see constants/trainer_constants.asm)
	table_width 1, TrainerEncounterMusic
	db MUSIC_HIKER_ENCOUNTER       ; none
	db MUSIC_YOUNGSTER_ENCOUNTER   ; falkner
	db MUSIC_LASS_ENCOUNTER        ; whitney
	db MUSIC_YOUNGSTER_ENCOUNTER   ; bugsy
	db MUSIC_OFFICER_ENCOUNTER     ; morty
	db MUSIC_OFFICER_ENCOUNTER     ; pryce
	db MUSIC_LASS_ENCOUNTER        ; jasmine
	db MUSIC_OFFICER_ENCOUNTER     ; chuck
	db MUSIC_BEAUTY_ENCOUNTER      ; clair
	db MUSIC_TRAINER_BATTLE        ; rival1
	db MUSIC_HIKER_ENCOUNTER       ; pokemon_prof
	db MUSIC_HIKER_ENCOUNTER       ; will
	db MUSIC_HIKER_ENCOUNTER       ; cal
	db MUSIC_OFFICER_ENCOUNTER     ; bruno
	db MUSIC_HIKER_ENCOUNTER       ; karen
	db MUSIC_HIKER_ENCOUNTER       ; koga
	db MUSIC_OFFICER_ENCOUNTER     ; champion
	db MUSIC_GYM_LEADER_BATTLE     ; brock
	db MUSIC_GYM_LEADER_BATTLE     ; misty
	db MUSIC_OFFICER_ENCOUNTER     ; lt_surge
	db MUSIC_MEET_EVIL_TRAINER     ; scientist
	db MUSIC_OFFICER_ENCOUNTER     ; erika
	db MUSIC_MEET_MALE_TRAINER     ; youngster
	db MUSIC_YOUNGSTER_ENCOUNTER   ; schoolboy
	db MUSIC_MEET_MALE_TRAINER     ; bird_keeper
	db MUSIC_MEET_FEMALE_TRAINER   ; lass
	db MUSIC_LASS_ENCOUNTER        ; janine
	db MUSIC_MEET_MALE_TRAINER     ; cooltrainerm
	db MUSIC_MEET_FEMALE_TRAINER   ; cooltrainerf
	db MUSIC_MEET_FEMALE_TRAINER   ; beauty
	db MUSIC_MEET_MALE_TRAINER     ; pokemaniac
	db MUSIC_MEET_EVIL_TRAINER     ; gruntm
	db MUSIC_MEET_MALE_TRAINER     ; gentleman
	db MUSIC_BEAUTY_ENCOUNTER      ; skier
	db MUSIC_BEAUTY_ENCOUNTER      ; teacher
	db MUSIC_BEAUTY_ENCOUNTER      ; sabrina
	db MUSIC_MEET_MALE_TRAINER     ; bug_catcher
	db MUSIC_HIKER_ENCOUNTER       ; fisher
	db MUSIC_MEET_MALE_TRAINER     ; swimmerm
	db MUSIC_MEET_FEMALE_TRAINER   ; swimmerf
	db MUSIC_MEET_MALE_TRAINER     ; sailor
	db MUSIC_MEET_MALE_TRAINER     ; super_nerd
	db MUSIC_TRAINER_BATTLE        ; rival2
	db MUSIC_MEET_MALE_TRAINER     ; guitarist
	db MUSIC_MEET_MALE_TRAINER     ; hiker
	db MUSIC_MEET_MALE_TRAINER     ; biker
	db MUSIC_OFFICER_ENCOUNTER     ; blaine
	db MUSIC_POKEMANIAC_ENCOUNTER  ; burglar
	db MUSIC_HIKER_ENCOUNTER       ; firebreather
	db MUSIC_POKEMANIAC_ENCOUNTER  ; juggler
	db MUSIC_HIKER_ENCOUNTER       ; blackbelt_t
	db MUSIC_MEET_EVIL_TRAINER     ; executivem
	db MUSIC_YOUNGSTER_ENCOUNTER   ; psychic_t
	db MUSIC_MEET_FEMALE_TRAINER   ; picnicker
	db MUSIC_MEET_MALE_TRAINER     ; camper
	db MUSIC_MEET_FEMALE_TRAINER   ; jr trainer f
	db MUSIC_MEET_MALE_TRAINER     ; jr trainer m
	db MUSIC_MEET_EVIL_TRAINER     ; executivef
	db MUSIC_SAGE_ENCOUNTER        ; sage
	db MUSIC_SAGE_ENCOUNTER        ; medium
	db MUSIC_HIKER_ENCOUNTER       ; boarder
	db MUSIC_HIKER_ENCOUNTER       ; pokefanm
	db MUSIC_KIMONO_ENCOUNTER      ; kimono_girl
	db MUSIC_LASS_ENCOUNTER        ; twins
	db MUSIC_BEAUTY_ENCOUNTER      ; pokefanf
	db MUSIC_TRAINER_BATTLE        ; blue1
	db MUSIC_TRAINER_BATTLE        ; blue2
	db MUSIC_TRAINER_BATTLE        ; blue3
	db MUSIC_HIKER_ENCOUNTER       ; officer
	db MUSIC_MEET_EVIL_TRAINER     ; gruntf
	db MUSIC_MEET_JESSIE_JAMES     ; team rocket
	db MUSIC_MEET_EVIL_TRAINER     ; giovanni
	db MUSIC_MEET_EVIL_TRAINER     ; gambler
	db MUSIC_MEET_MALE_TRAINER     ; engineer
	db MUSIC_HIKER_ENCOUNTER       ; mysticalman
	assert_table_length NUM_TRAINER_CLASSES -3 ; exclude ENBY, AERODACTYLE_FOSSIL, KABUTOPS_FOSSIL, MOON_STONE_T
	db MUSIC_HIKER_ENCOUNTER       ; unused
	db MUSIC_HIKER_ENCOUNTER       ; unused
	db MUSIC_HIKER_ENCOUNTER       ; unused
