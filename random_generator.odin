package main

import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

value: cstring

width: f32 = 50
height: f32 = 50
spacing: f32 = 10
posX: f32 = 250
posY: f32 = 170
border: f32 = 10

buf: [8]byte

is_drag := false
window_handle_rect: rl.Rectangle

draw_random_generator :: proc() {

	rl.DrawText(value, 300, 50, 96, {0, 0, 0, 255})

	rl.GuiGroupBox(
		{
			posX - border,
			posY - border,
			3 * spacing + 4 * width + 2 * border,
			1 * spacing + 2 * height + 2 * border,
		},
		"Random",
	)
	if rl.GuiButton({posX, posY, width, height}, "d2") {
		value = strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 2)))
	}
	if rl.GuiButton({posX + width + spacing, posY, width, height}, "d4") {
		value = strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 4)))
	}
	if rl.GuiButton({posX + 2 * (width + spacing), posY, width, height}, "d6") {
		value = strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 6)))
	}
	if rl.GuiButton({posX + 3 * (width + spacing), posY, width, height}, "d8") {
		value = strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 8)))
	}
	if rl.GuiButton({posX, posY + spacing + height, width, height}, "d10") {
		value = strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 10)))
	}
	if rl.GuiButton({posX + width + spacing, posY + spacing + height, width, height}, "d12") {
		value = strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 12)))
	}
	if rl.GuiButton(
		{posX + 2 * (width + spacing), posY + spacing + height, width, height},
		"d20",
	) {
		value = strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 20)))
	}
	if rl.GuiButton(
		{posX + 3 * (width + spacing), posY + spacing + height, width, height},
		"d100",
	) {
		value = strings.clone_to_cstring(strconv.itoa(buf[:], auto_cast rl.GetRandomValue(1, 100)))
	}

}

update_windows_handler :: proc() {
	window_handle_rect = {
		posX - border,
		posY - border - 10,
		3 * spacing + 4 * width + 2 * border,
		20,
	}

	if rl.CheckCollisionPointRec(rl.GetMousePosition(), window_handle_rect) &&
	   rl.IsMouseButtonPressed(.LEFT) {
		is_drag = true
	}
	if rl.CheckCollisionPointRec(rl.GetMousePosition(), window_handle_rect) &&
	   rl.IsMouseButtonReleased(.LEFT) {
		is_drag = false
	}
	if is_drag {
		posX += rl.GetMouseDelta()[0]
		posY += rl.GetMouseDelta()[1]
	}
	if rl.CheckCollisionPointRec(rl.GetMousePosition(), {50, 20, 100, 170}) {
		//is_drag = false
	}
	if rl.IsKeyPressed(.BACKSPACE) {
		is_drag = false
	}
	if !rl.IsWindowFocused() {
		is_drag = false
	}
	if rl.CheckCollisionRecs(
		   {
			   posX - border,
			   posY - border,
			   3 * spacing + 4 * width + 2 * border,
			   1 * spacing + 2 * height + 2 * border,
		   },
		   {50, 20, 120, 190},
	   ) &&
	   is_custom_random_show == true {
		is_custom_random_show = false
	}
}
