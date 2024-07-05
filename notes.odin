package main

import "core:fmt"
import "core:math/rand"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"


notes_struct :: struct {
	note:         cstring,
	is_contained: bool,
}
notes := [12]notes_struct {
	{"C", true},
	{"C#", true},
	{"D", true},
	{"D#", true},
	{"E", true},
	{"F", true},
	{"F#", true},
	{"G", true},
	{"G#", true},
	{"A", true},
	{"A#", true},
	{"B", true},
}

notes_output: cstring

note_count: i32 = 8


draw_notes_generator :: proc() {
	rl.DrawText(
		notes_output,
		(rl.GetScreenWidth() - rl.MeasureText(notes_output, 60)) / 2,
		40,
		60,
		{0, 0, 0, 255},
	)

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

	contained_notes: [dynamic]cstring
	notes_array: [dynamic]string

	if rl.GuiButton({350, 250, 100, 20}, "generate") {
		for i in notes {
			if i.is_contained {
				append(&contained_notes, i.note)
			}
		}
		for i in 0 ..< note_count {
			append(&notes_array, auto_cast rand.choice(contained_notes[:]), " ")
		}
		notes_output = strings.clone_to_cstring(strings.concatenate(notes_array[:]))
	}

	if rl.GuiButton({320, 250, 20, 20}, "#b") {
	}
}
