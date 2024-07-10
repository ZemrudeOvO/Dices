package main

import "core:c"
import "core:fmt"
import "core:math/rand"
import "core:strings"
import rl "vendor:raylib"

@(private = "file")
font_size: c.int = 24

@(private = "file")
notes_struct :: struct {
	sharp:        cstring,
	flat:         cstring,
	is_contained: bool,
}

@(private = "file")
notes := [12]notes_struct {
	{"C", "C", true},
	{"C#", "Db", true},
	{"D", "D", true},
	{"D#", "Eb", true},
	{"E", "E", true},
	{"F", "F", true},
	{"F#", "Gb", true},
	{"G", "G", true},
	{"G#", "Ab", true},
	{"A", "A", true},
	{"A#", "Bb", true},
	{"B", "B", true},
}

@(private = "file")
chords_struct :: struct {
	name:         cstring,
	is_contained: bool,
}

@(private = "file")
chords := [11]chords_struct {
	{"", true},
	{"m", true},
	{"aug", true},
	{"dim", true},
	{"sus2", true},
	{"maj7", true},
	{"m7", true},
	{"7", true},
	{"7sus", true},
	{"m7(b5)", true},
	{"dim7", true},
}

@(private = "file")
chord_count: i32 = 8

@(private = "file")
is_sharp: bool

@(private = "file")
is_toggle_sharp_state: c.int

@(private = "file")
output_sharp, output_flat: [dynamic]string

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

	is_toggle_sharp_state = rl.GuiToggle({370, 250, 20, 20}, is_sharp ? "#" : "b", &is_sharp)

	contained_sharp, contained_flat: [dynamic]cstring
	sharp_array, flat_array: [dynamic]string

	contained_chord: [dynamic]cstring
	chord_array: [dynamic]string

	if rl.GuiButton({400, 250, 70, 20}, "generate") {
		clear_dynamic_array(&output_sharp)
		clear_dynamic_array(&output_flat)

		for i in notes {
			append(&contained_sharp, i.sharp)
			append(&contained_flat, i.flat)
		}

		jndex := 0

		for i in 0 ..< chord_count {
			jndex = rand.int_max(len(contained_sharp))
			append(&sharp_array, auto_cast contained_sharp[jndex])
			append(&flat_array, auto_cast contained_flat[jndex])
		}

		for i in chords {
			if i.is_contained {
				append(&contained_chord, i.name)
			}
		}

		index := 0

		for i in 0 ..< chord_count {
			if len(contained_chord) != 0 {
				index = rand.int_max(len(contained_chord))
				append(&chord_array, auto_cast contained_chord[index])
			}
		}

		for i in 0 ..< chord_count {
			if len(contained_chord) != 0 {
				append(&output_sharp, sharp_array[i])
				append(&output_sharp, chord_array[i])
				append(&output_flat, flat_array[i])
				append(&output_flat, chord_array[i])

				if i % 4 == 3 {
					append(&output_sharp, "\n\n\n")
					append(&output_flat, "\n\n\n")
				} else {
					append(&output_sharp, " ")
					append(&output_flat, " ")
				}
			}
		}
	}

	rl.DrawText(
		is_sharp \
		? strings.clone_to_cstring(strings.concatenate(output_sharp[:])) \
		: strings.clone_to_cstring(strings.concatenate(output_flat[:])),
		(rl.GetScreenWidth() -
			rl.MeasureText(
				is_sharp \
				? strings.clone_to_cstring(strings.concatenate(output_sharp[:])) \
				: strings.clone_to_cstring(strings.concatenate(output_flat[:])),
				font_size,
			)) /
		2,
		40,
		font_size,
		{0, 0, 0, 255},
	)
}
