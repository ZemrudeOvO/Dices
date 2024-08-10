package main

import "core:fmt"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

font: rl.Font

main :: proc() {
	rl.SetTraceLogLevel(.WARNING)
	rl.InitWindow(500, 300, "Dices")
	defer rl.CloseWindow()

	content: cstring = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789#()+-/"
	count := rl.GetCodepointCount(content)
	code_points := rl.LoadCodepoints(auto_cast content, &count)
	font_data := #load("./Monaco.ttf")
	font = rl.LoadFontFromMemory(
		".ttf",
		raw_data(font_data),
		auto_cast len(font_data[:]),
		96,
		code_points,
		count,
	)
	rl.GuiSetFont(font)

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.SetTargetFPS(rl.IsWindowFocused() ? 60 : 10)

		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground({255, 255, 255, 255})

		draw_tab()
		switch_tab()

		rl.GuiButton({50, 50, 100, 100}, "ABCD")
	}
}
