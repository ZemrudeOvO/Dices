package main

import "core:c"
import "core:fmt"
import "core:math/rand"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

@(private = "file")
is_sharp: bool

@(private = "file")
notes_struct :: struct {
	sharp: string,
	flat:  string,
}

@(private = "file")
notes := [12]notes_struct {
	{"C", "C"},
	{"C#", "Db"},
	{"D", "D"},
	{"D#", "Eb"},
	{"E", "E"},
	{"F", "F"},
	{"F#", "Gb"},
	{"G", "G"},
	{"G#", "Ab"},
	{"A", "A"},
	{"A#", "Bb"},
	{"B", "B"},
}
@(private = "file")
key_sharp, key_flat: [dynamic]string
note_index, sharp_or_flat: int

@(private = "file")
times := [?]cstring {
	"2/4",
	"3/4",
	"4/4",
	"5/4",
	"6/4",
	"3/8",
	"4/8",
	"5/8",
	"6/8",
	"7/8",
	"9/8",
	"12/8",
	"2/2",
	"3/2",
}

@(private = "file")
time: cstring

@(private = "file")
modes := [?]cstring{"Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Aeolian", "Locrian"}
@(private = "file")
mode: cstring

@(private = "file")
tempo: c.int

@(private = "file")
buf: [8]byte

@(private = "file")
is_first_time := true

draw_misc_generator :: proc() {

	if rl.GuiButton({350, 50, 100, 40}, "Key") {
		clear_dynamic_array(&key_sharp)
		clear_dynamic_array(&key_flat)

		note_index = rand.int_max(12)
		sharp_or_flat = rand.int_max(2)
		append(&key_sharp, notes[note_index].sharp, " ", sharp_or_flat == 0 ? "Major" : "Minor")
		append(&key_flat, notes[note_index].flat, " ", sharp_or_flat == 0 ? "Major" : "Minor")
	}
	rl.GuiToggle({300, 50, 40, 40}, is_sharp ? "#" : "b", &is_sharp)

	if rl.GuiButton({350, 110, 100, 40}, "Time") {
		time = times[rand.int_max(len(times))]
	}
	if rl.GuiButton({350, 170, 100, 40}, "Mode") {
		mode = modes[rand.int_max(len(modes))]
	}
	if rl.GuiButton({350, 230, 100, 40}, "Tempo") {
		is_first_time = false
		tempo = rl.GetRandomValue(50, 200)
	}

	rl.DrawText(
		is_sharp \
		? strings.clone_to_cstring(strings.concatenate(key_sharp[:])) \
		: strings.clone_to_cstring(strings.concatenate(key_flat[:])),
		50,
		50,
		30,
		{0, 0, 0, 255},
	)
	rl.DrawText(time, 50, 110, 30, {0, 0, 0, 255})
	rl.DrawText(mode, 50, 170, 30, {0, 0, 0, 255})
	rl.DrawText(
		is_first_time ? "" : strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast tempo)),
		50,
		230,
		30,
		{0, 0, 0, 255},
	)
}
