package main

import "core:fmt"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"


main :: proc() {
	rl.InitWindow(500, 300, "Dices")
	defer rl.CloseWindow()

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground({255, 255, 255, 255})

		custom_random_generator()
		draw_random_generator()
		update_windows_handler()

		reset_random_generator()
		show_debug_collision_region()
		show_info()
	}
}
