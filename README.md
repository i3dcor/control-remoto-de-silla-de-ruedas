# Electric Wheelchair Remote Control

Unified working repository for the electric wheelchair remote-control project.

## Contents

- `microbit-joystick-2-ruedas/` — MakeCode/micro:bit joystick project integrated from [i3dcor/microbit-joystick-2-ruedas](https://github.com/i3dcor/microbit-joystick-2-ruedas).
- `microbit/` — compiled micro:bit firmware files kept with the original project material.
- `bldc-hardware/` — BLDC controller hardware design files.
- `3d/`, `ble/`, `doc/`, `info/`, and the remaining folders — mechanical designs, Bluetooth experiments, documentation, references, and project notes from the local source folder.

## Integration notes

The source repository was copied into its own directory so its MakeCode files remain directly importable and easy to identify. The original source URL is retained above. Nested `.git` directories were intentionally excluded so this project can have one unified Git history.

This repository contains research material and experimental firmware. Validate all electrical, mechanical, and safety assumptions before operating a wheelchair or motor controller.
