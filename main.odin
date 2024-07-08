package main

import "core:fmt"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

unifont: rl.Font

main :: proc() {
	rl.InitWindow(500, 300, "Dices")
	defer rl.CloseWindow()

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground({255, 255, 255, 255})

		draw_tab()
		switch_tab()

		show_info()
	}
}
