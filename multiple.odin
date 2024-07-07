package main

import "core:fmt"
import "core:math/rand"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

@(private = "file")
quantity: i32 = 1

@(private = "file")
sides: i32 = 6

@(private = "file")
fixed: i32 = 0

@(private = "file")
multiple_dices_value: cstring

draw_multiple_dices_generator :: proc() {

	rl.GuiSpinner({100, 200, 100, 20}, "quantity (a) ", &quantity, 0, 16, false)
	rl.GuiSpinner({100, 230, 100, 20}, "sides (b) ", &sides, 2, 100, false)
	rl.GuiSpinner({100, 260, 100, 20}, "fixed (c) ", &fixed, -100, 100, false)

	rl.GuiLabel({220, 230, 100, 20}, "aDb+c")

	rl.DrawText(
		multiple_dices_value,
		(rl.GetScreenWidth() - rl.MeasureText(multiple_dices_value, 96)) / 2,
		40,
		96,
		{0, 0, 0, 255},
	)

	if rl.GuiButton({320, 200, 80, 80}, "Roll") {
		value: i32
		for i in 0 ..< quantity {
			value += rl.GetRandomValue(1, sides)
		}
		multiple_dices_value = strings.clone_to_cstring(
			strconv.itoa(buf[:], auto_cast (value + fixed)),
		)
	}
}
