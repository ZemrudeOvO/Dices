package main

import "core:fmt"
import rl "vendor:raylib"

@(private = "file")
chords_struct :: struct {
	name:         cstring,
	is_contained: bool,
}

@(private = "file")
chords := [11]chords_struct {
	{"", false},
	{"m", false},
	{"aug", false},
	{"dim", false},
	{"sus2", false},
	{"maj7", false},
	{"m7", false},
	{"7", false},
	{"7sus", false},
	{"m7(b5)", false},
	{"dim7", false},
}

@(private = "file")
chord_count: i32 = 8

draw_chords_generator :: proc() {
	rl.GuiToggle({50, 220, 40, 20}, "major", &chords[0].is_contained) // C
	rl.GuiToggle({100, 220, 40, 20}, "minor", &chords[1].is_contained) // Cm
	rl.GuiToggle({150, 220, 40, 20}, "aug", &chords[2].is_contained) // Caug
	rl.GuiToggle({200, 220, 40, 20}, "dim", &chords[3].is_contained) // Cdim
	rl.GuiToggle({250, 220, 40, 20}, "sus2", &chords[4].is_contained) //Csus2
	rl.GuiToggle({50, 250, 40, 20}, "maj7", &chords[5].is_contained) //Cmaj7
	rl.GuiToggle({100, 250, 40, 20}, "m7", &chords[6].is_contained) //Cm7
	rl.GuiToggle({150, 250, 40, 20}, "7", &chords[7].is_contained) // C7
	rl.GuiToggle({200, 250, 40, 20}, "7sus", &chords[8].is_contained) // C7sus
	rl.GuiToggle({250, 250, 40, 20}, "m7(b5)", &chords[9].is_contained) // Cm7(b5)
	rl.GuiToggle({300, 250, 40, 20}, "dim7", &chords[10].is_contained) // Cdim7

	rl.GuiSpinner({370, 220, 100, 20}, "chord count", &chord_count, 1, 16, false)
}
