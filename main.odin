package main

import "core:fmt"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

width: f32 = 50
height: f32 = 50
spacing: f32 = 10
posX: f32 = 200
posY: f32 = 200
border: f32 = 10

buf: [8]byte
value: cstring

main :: proc() {
	rl.InitWindow(960, 540, "Dices")
	defer rl.CloseWindow()

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground({255, 255, 255, 255})

		rl.DrawFPS(2, 2)


		rl.GuiSlider(
			{50, 20, 100, 20},
			"width",
			strings.clone_to_cstring(
				strings.trim_left(strconv.ftoa(buf[:], auto_cast width, 'f', 0, 64), "+"),
			),
			&width,
			0,
			200,
		)

		rl.GuiSlider(
			{50, 50, 100, 20},
			"height",
			strings.clone_to_cstring(
				strings.trim_left(strconv.ftoa(buf[:], auto_cast height, 'f', 0, 64), "+"),
			),
			&height,
			0,
			200,
		)

		rl.GuiSlider(
			{50, 80, 100, 20},
			"spacing",
			strings.clone_to_cstring(
				strings.trim_left(strconv.ftoa(buf[:], auto_cast spacing, 'f', 0, 64), "+"),
			),
			&spacing,
			0,
			200,
		)


		rl.GuiSlider(
			{50, 110, 100, 20},
			"posX",
			strings.clone_to_cstring(
				strings.trim_left(strconv.ftoa(buf[:], auto_cast posX, 'f', 0, 64), "+"),
			),
			&posX,
			0,
			f32(rl.GetScreenWidth()),
		)

		rl.GuiSlider(
			{50, 140, 100, 20},
			"posY",
			strings.clone_to_cstring(
				strings.trim_left(strconv.ftoa(buf[:], auto_cast posY, 'f', 0, 64), "+"),
			),
			&posY,
			0,
			f32(rl.GetScreenHeight()),
		)

		rl.GuiSlider(
			{50, 170, 100, 20},
			"border",
			strings.clone_to_cstring(
				strings.trim_left(strconv.ftoa(buf[:], auto_cast border, 'f', 0, 64), "+"),
			),
			&border,
			5,
			200,
		)

		rl.GuiGroupBox(
			{
				posX - border,
				posY - border,
				3 * spacing + 4 * width + 2 * border,
				1 * spacing + 2 * height + 2 * border,
			},
			"Random",
		)

		//rl.GuiTextBox({300, 100, 500, 300}, value, 300, false)
		rl.DrawText(value, 300, 50, 96, {0, 0, 0, 255})

		if rl.GuiButton({posX, posY, width, height}, "D2") {
			value = strings.clone_to_cstring(
				strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 2)),
			)
		}
		if rl.GuiButton({posX + width + spacing, posY, width, height}, "D4") {
			value = strings.clone_to_cstring(
				strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 4)),
			)
		}
		if rl.GuiButton({posX + 2 * (width + spacing), posY, width, height}, "D6") {
			value = strings.clone_to_cstring(
				strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 6)),
			)
		}
		if rl.GuiButton({posX + 3 * (width + spacing), posY, width, height}, "D8") {
			value = strings.clone_to_cstring(
				strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 8)),
			)
		}
		if rl.GuiButton({posX, posY + spacing + height, width, height}, "D10") {
			value = strings.clone_to_cstring(
				strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 10)),
			)
		}
		if rl.GuiButton({posX + width + spacing, posY + spacing + height, width, height}, "D12") {
			value = strings.clone_to_cstring(
				strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 12)),
			)
		}
		if rl.GuiButton(
			{posX + 2 * (width + spacing), posY + spacing + height, width, height},
			"D20",
		) {
			value = strings.clone_to_cstring(
				strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 20)),
			)
		}
		if rl.GuiButton(
			{posX + 3 * (width + spacing), posY + spacing + height, width, height},
			"D100",
		) {
			value = strings.clone_to_cstring(
				strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 100)),
			)
		}

		if rl.IsKeyPressed(.ONE) {
			rl.GuiSetState(1)
		}
		if rl.IsKeyPressed(.TWO) {
			rl.GuiSetState(2)
		}
		if rl.IsKeyPressed(.THREE) {
			rl.GuiSetState(3)
		}
		if rl.IsKeyPressed(.FOUR) {
			rl.GuiSetState(4)
		}
		if rl.IsKeyPressed(.BACKSPACE) {
			rl.GuiSetState(0)
		}
	}
}
