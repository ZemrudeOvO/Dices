package main

import "core:fmt"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

@(private = "file")
random_value: cstring

buf: [8]byte

@(private = "file")
is_drag := false

@(private = "file")
window_handle_rect: rl.Rectangle

draw_random_generator :: proc() {

	rl.DrawText(
		random_value,
		(rl.GetScreenWidth() - rl.MeasureText(random_value, 96)) / 2,
		40,
		96,
		{0, 0, 0, 255},
	)

	rl.GuiGroupBox({125, 160, 250, 130}, "Random")

	if rl.GuiButton({135, 170, 50, 50}, "d2") {
		random_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 2)),
		)
	}
	if rl.GuiButton({195, 170, 50, 50}, "d4") {
		random_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 4)),
		)
	}
	if rl.GuiButton({255, 170, 50, 50}, "d6") {
		random_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 6)),
		)
	}
	if rl.GuiButton({315, 170, 50, 50}, "d8") {
		random_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 8)),
		)
	}
	if rl.GuiButton({135, 230, 50, 50}, "d10") {
		random_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 10)),
		)
	}
	if rl.GuiButton({195, 230, 50, 50}, "d12") {
		random_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 12)),
		)
	}
	if rl.GuiButton({255, 230, 50, 50}, "d20") {
		random_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 20)),
		)
	}
	if rl.GuiButton({315, 230, 50, 50}, "d100") {
		random_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 100)),
		)
	}

}
