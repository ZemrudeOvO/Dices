package main

import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

@(private = "file")
is_collision_show := false

@(private = "file")
is_custom_random_show := false

show_info :: proc() {
	info: cstring = "Alpha 0.3"
	rl.GuiLabel({5, f32(rl.GetRenderHeight()) - 15, f32(rl.GetRenderWidth()), 15}, info)
}
