<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a simple level-sensitive D latch using standard-cell digital logic.
A D latch is a basic sequential storage element that has two modes of operation:

Transparent mode (clk = 1):
The output Q continuously follows the input D. Any change on D appears immediately at the output.

Latch / Hold mode (clk = 0):
The output holds its previous value, ignoring any changes on D.

An active-low asynchronous reset (rst_n) is also included.
When rst_n = 0, the latch is forced to Q = 0 regardless of the clock or input state.

Only one input pin is used:

ui_in[0] → D

And one output:

uo_out[0] → Q

All unused pins are tied off internally.

## How to test

| clk | D     | Q behavior             |
| --- | ----- | ---------------------- |
| 1   | 1     | Q becomes 1            |
| 1   | 0     | Q becomes 0            |
| 0   | 1 → 0 | Q holds previous value |
| 0   | X     | Q unchanged            |

## External hardware

NONE
