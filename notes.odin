package main

import "core:c"
import "core:fmt"
import "core:math/rand"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"


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
output_sharp, output_flat: cstring

@(private = "file")
note_count: i32 = 8

@(private = "file")
is_sharp: bool

@(private = "file")
is_toggle_sharp_state: c.int

draw_notes_generator :: proc() {

	rl.GuiCheckBox({40, 250, 20, 20}, nil, &notes[0].is_contained)
	rl.GuiCheckBox({60, 230, 20, 20}, nil, &notes[1].is_contained)
	rl.GuiCheckBox({80, 250, 20, 20}, nil, &notes[2].is_contained)
	rl.GuiCheckBox({100, 230, 20, 20}, nil, &notes[3].is_contained)
	rl.GuiCheckBox({120, 250, 20, 20}, nil, &notes[4].is_contained)
	rl.GuiCheckBox({140, 250, 20, 20}, nil, &notes[5].is_contained)
	rl.GuiCheckBox({160, 230, 20, 20}, nil, &notes[6].is_contained)
	rl.GuiCheckBox({180, 250, 20, 20}, nil, &notes[7].is_contained)
	rl.GuiCheckBox({200, 230, 20, 20}, nil, &notes[8].is_contained)
	rl.GuiCheckBox({220, 250, 20, 20}, nil, &notes[9].is_contained)
	rl.GuiCheckBox({240, 230, 20, 20}, nil, &notes[10].is_contained)
	rl.GuiCheckBox({260, 250, 20, 20}, nil, &notes[11].is_contained)

	rl.GuiSpinner({350, 220, 100, 20}, "note count", &note_count, 1, 16, false)

	contained_sharp, contained_flat: [dynamic]cstring
	sharp_array, flat_array: [dynamic]string

	if rl.GuiButton({350, 250, 100, 20}, "generate") {
		for i in notes {
			if i.is_contained {
				append(&contained_sharp, i.sharp)
				append(&contained_flat, i.flat)
			}
		}

		index := 0

		for i in 0 ..< note_count {
			if len(contained_sharp) != 0 {

				index = rand.int_max(len(contained_sharp))
				append(&sharp_array, auto_cast contained_sharp[index])
				append(&flat_array, auto_cast contained_flat[index])

				if i % 4 == 3 {
					append(&sharp_array, "\n\n\n")
					append(&flat_array, "\n\n\n")
				} else {
					append(&sharp_array, " ")
					append(&flat_array, " ")
				}
			}
		}
		output_sharp = strings.clone_to_cstring(strings.concatenate(sharp_array[:]))
		output_flat = strings.clone_to_cstring(strings.concatenate(flat_array[:]))
	}

	is_toggle_sharp_state = rl.GuiToggle({320, 250, 20, 20}, is_sharp ? "#" : "b", &is_sharp)

	rl.DrawText(
		is_sharp ? output_sharp : output_flat,
		(rl.GetScreenWidth() - rl.MeasureText(is_sharp ? output_sharp : output_flat, 36)) / 2,
		40,
		36,
		{0, 0, 0, 255},
	)
}
