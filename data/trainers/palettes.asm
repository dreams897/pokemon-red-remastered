TrainerPalettes:
; entries correspond to trainer classes

; Each .gbcpal is generated from the corresponding .png, and
; only the middle two colors are included, not black or white.

	table_width PAL_COLOR_SIZE * 2, TrainerPalettes

PlayerPalette:
INCBIN "gfx/trainers/red.gbcpal", middle_colors
INCBIN "gfx/trainers/falkner.gbcpal", middle_colors
INCBIN "gfx/trainers/whitney.gbcpal", middle_colors
GreenPalette: ; Green/Leaf shares Bugsy's palette
INCBIN "gfx/trainers/bugsy.gbcpal", middle_colors
INCBIN "gfx/trainers/morty.gbcpal", middle_colors
INCBIN "gfx/trainers/pryce.gbcpal", middle_colors
INCBIN "gfx/trainers/jasmine.gbcpal", middle_colors
INCBIN "gfx/trainers/chuck.gbcpal", middle_colors
INCBIN "gfx/trainers/clair.gbcpal", middle_colors
INCBIN "gfx/trainers/rival1.gbcpal", middle_colors
INCBIN "gfx/trainers/oak.gbcpal", middle_colors
INCBIN "gfx/trainers/will.gbcpal", middle_colors
INCBIN "gfx/trainers/cal.gbcpal", middle_colors
INCBIN "gfx/trainers/bruno.gbcpal", middle_colors
INCBIN "gfx/trainers/karen.gbcpal", middle_colors
INCBIN "gfx/trainers/koga.gbcpal", middle_colors
INCBIN "gfx/trainers/champion.gbcpal", middle_colors
INCBIN "gfx/trainers/brock.gbcpal", middle_colors
INCBIN "gfx/trainers/misty.gbcpal", middle_colors
INCBIN "gfx/trainers/lt_surge.gbcpal", middle_colors
INCBIN "gfx/trainers/scientist.gbcpal", middle_colors
INCBIN "gfx/trainers/erika.gbcpal", middle_colors
INCBIN "gfx/trainers/youngster.gbcpal", middle_colors
INCBIN "gfx/trainers/schoolboy.gbcpal", middle_colors
INCBIN "gfx/trainers/bird_keeper.gbcpal", middle_colors
INCBIN "gfx/trainers/lass.gbcpal", middle_colors
INCBIN "gfx/trainers/janine.gbcpal", middle_colors
INCBIN "gfx/trainers/cooltrainer_m.gbcpal", middle_colors
INCBIN "gfx/trainers/cooltrainer_f.gbcpal", middle_colors
INCBIN "gfx/trainers/beauty.gbcpal", middle_colors
INCBIN "gfx/trainers/pokemaniac.gbcpal", middle_colors
INCBIN "gfx/trainers/grunt_m.gbcpal", middle_colors
INCBIN "gfx/trainers/gentleman.gbcpal", middle_colors
INCBIN "gfx/trainers/skier.gbcpal", middle_colors
INCBIN "gfx/trainers/teacher.gbcpal", middle_colors
INCBIN "gfx/trainers/sabrina.gbcpal", middle_colors
INCBIN "gfx/trainers/bug_catcher.gbcpal", middle_colors
INCBIN "gfx/trainers/fisher.gbcpal", middle_colors
INCBIN "gfx/trainers/swimmer_m.gbcpal", middle_colors
INCBIN "gfx/trainers/swimmer_f.gbcpal", middle_colors
INCBIN "gfx/trainers/sailor.gbcpal", middle_colors
INCBIN "gfx/trainers/super_nerd.gbcpal", middle_colors
INCBIN "gfx/trainers/rival2.gbcpal", middle_colors
INCBIN "gfx/trainers/guitarist.gbcpal", middle_colors
INCBIN "gfx/trainers/hiker.gbcpal", middle_colors
INCBIN "gfx/trainers/biker.gbcpal", middle_colors
INCBIN "gfx/trainers/blaine.gbcpal", middle_colors
INCBIN "gfx/trainers/burglar.gbcpal", middle_colors
INCBIN "gfx/trainers/firebreather.gbcpal", middle_colors
INCBIN "gfx/trainers/juggler.gbcpal", middle_colors
INCBIN "gfx/trainers/blackbelt_t.gbcpal", middle_colors
INCBIN "gfx/trainers/executive_m.gbcpal", middle_colors
INCBIN "gfx/trainers/psychic_t.gbcpal", middle_colors
INCBIN "gfx/trainers/picnicker.gbcpal", middle_colors
INCBIN "gfx/trainers/camper.gbcpal", middle_colors
INCBIN "gfx/trainers/jrtrainerf.gbcpal", middle_colors
INCBIN "gfx/trainers/jrtrainerm.gbcpal", middle_colors
INCBIN "gfx/trainers/executive_f.gbcpal", middle_colors
INCBIN "gfx/trainers/sage.gbcpal", middle_colors
INCBIN "gfx/trainers/medium.gbcpal", middle_colors
INCBIN "gfx/trainers/boarder.gbcpal", middle_colors
INCBIN "gfx/trainers/pokefan_m.gbcpal", middle_colors
INCBIN "gfx/trainers/kimono_girl.gbcpal", middle_colors
INCBIN "gfx/trainers/twins.gbcpal", middle_colors
INCBIN "gfx/trainers/pokefan_f.gbcpal", middle_colors
INCBIN "gfx/trainers/blue1.gbcpal", middle_colors
INCBIN "gfx/trainers/blue2.gbcpal", middle_colors
INCBIN "gfx/trainers/blue3.gbcpal", middle_colors
INCBIN "gfx/trainers/officer.gbcpal", middle_colors
INCBIN "gfx/trainers/grunt_f.gbcpal", middle_colors
INCBIN "gfx/trainers/team_rocket.gbcpal", middle_colors
INCBIN "gfx/trainers/giovanni.gbcpal", middle_colors
INCBIN "gfx/trainers/gambler.gbcpal", middle_colors
INCBIN "gfx/trainers/engineer.gbcpal", middle_colors
INCBIN "gfx/trainers/kabutops_fossil.gbcpal", middle_colors
INCBIN "gfx/trainers/aerodactyl_fossil.gbcpal", middle_colors
INCBIN "gfx/trainers/moon_stone.gbcpal", middle_colors
EnbyPalette: ; enby gets their own pal
INCBIN "gfx/trainers/enby.gbcpal", middle_colors
INCBIN "gfx/trainers/mysticalman.gbcpal", middle_colors
	assert_table_length NUM_TRAINER_CLASSES + 1
