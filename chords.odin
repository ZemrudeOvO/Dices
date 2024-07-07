package main

import "core:fmt"
import rl "vendor:raylib"

toggle_state: [11]bool

draw_chords_generator :: proc() {
	rl.GuiToggle({450, 20, 40, 20}, "major", &toggle_state[0]) // C
	rl.GuiToggle({450, 45, 40, 20}, "minor", &toggle_state[1]) // Cm
	rl.GuiToggle({450, 70, 40, 20}, "aug", &toggle_state[2]) // C+
	rl.GuiToggle({450, 95, 40, 20}, "dim", &toggle_state[3]) // Cdim
	rl.GuiToggle({450, 120, 40, 20}, "sus2", &toggle_state[4]) //Csus2

	rl.GuiToggle({450, 145, 40, 20}, "maj7", &toggle_state[5]) //Cmaj7
	rl.GuiToggle({450, 170, 40, 20}, "m7", &toggle_state[6]) //Cm7
	rl.GuiToggle({450, 195, 40, 20}, "7", &toggle_state[7]) // C7
	rl.GuiToggle({450, 220, 40, 20}, "7sus", &toggle_state[8]) // C7sus
	rl.GuiToggle({450, 245, 40, 20}, "m7(b5)", &toggle_state[9]) // Cm7(b5)

	rl.GuiToggle({450, 270, 40, 20}, "dim7", &toggle_state[10]) // Cdim7
}
