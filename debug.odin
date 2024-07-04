package main

import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

is_collision_show := false
is_custom_random_show := false

show_debug_collision_region :: proc() {
	if rl.IsKeyPressed(.D) {is_collision_show = !is_collision_show}
	if is_collision_show {
		if is_collision_show {
			rl.DrawRectangle(
				i32(window_handle_rect.x),
				i32(window_handle_rect.y),
				i32(window_handle_rect.width),
				i32(window_handle_rect.height),
				{255, 0, 0, 128},
			)
		}
		if is_custom_random_show {
			rl.DrawRectangle(50, 20, 120, 190, {0, 255, 0, 128})
		}
	}
}

show_info :: proc() {
	info: cstring = "Alpha 0.2"
	rl.GuiLabel({5, f32(rl.GetRenderHeight()) - 15, f32(rl.GetRenderWidth()), 15}, info)
}

custom_random_generator :: proc() {
	if rl.IsKeyPressed(.C) {is_custom_random_show = !is_custom_random_show}
	if is_custom_random_show &&
	   !rl.CheckCollisionRecs(
			   {
				   posX - border,
				   posY - border,
				   3 * spacing + 4 * width + 2 * border,
				   1 * spacing + 2 * height + 2 * border,
			   },
			   {50, 20, 120, 190},
		   ) {
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
	}
}

reset_random_generator :: proc() {
	if rl.IsKeyPressed(.R) {

		width = 50
		height = 50
		spacing = 10
		posX = 200
		posY = 200
		border = 10
	}
}
