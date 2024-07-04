package main

import rl "vendor:raylib"

current_tab: i32 = 0

draw_tab :: proc() {
	rl.GuiToggleGroup({5, 5, 60, 20}, "Dice;Calculator;Notes;Chords;Scales", &current_tab)
}

switch_tab :: proc() {
	switch current_tab {
	case 0:
		draw_random_generator()
	case 1:
	case 2:
		draw_notes_generator()
	case 3:

	case: // default

	}
}
