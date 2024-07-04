package main

import "core:fmt"
import rl "vendor:raylib"

notes_output: cstring

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

note_count: i32 = 8
required_note_count: i32

draw_notes_generator :: proc() {
	rl.DrawText(
		notes_output,
		(rl.GetScreenWidth() - rl.MeasureText(notes_output, 96)) / 2,
		40,
		96,
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

	required_note_count = rl.GuiSpinner(
		{350, 220, 100, 20},
		"note count",
		&note_count,
		1,
		16,
		false,
	)
	if rl.GuiButton({350, 250, 100, 20}, "generate") {
		count := 0
		for auto_cast count < required_note_count {
		}
	}
}
