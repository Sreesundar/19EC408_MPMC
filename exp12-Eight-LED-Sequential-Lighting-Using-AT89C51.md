# Experiment 12 — Eight-LED Sequential Lighting System Using AT89C51

> **Project name:** LED Motion Engine  
> **Course:** 19EC408 — Microprocessors and Microcontrollers Laboratory  
> **Controller:** AT89C51 (8051 family)  
> **Programming language:** 8051 Assembly  
> **Development tools:** Keil µVision and Proteus

## Aim

To design and simulate an eight-LED sequential lighting system using the AT89C51 microcontroller and 8051 Assembly language. The system is planned to support three lighting patterns: forward running, reverse running, and a back-and-forth (bounce) sequence.

## Objectives

- Interface eight LEDs with Port 2 of the AT89C51.
- Generate sequential output patterns using 8051 assembly instructions.
- Use bit rotation and branching concepts to create different LED motions.
- Select the lighting pattern through two digital input switches.
- Assemble the program in Keil µVision and verify the circuit in Proteus.

## Operating Modes

Two input switches select the pattern. This table assumes active-HIGH inputs with suitable pull-down resistors.

| P1.1 | P1.0 | Selected mode | LED motion |
|---:|---:|---|---|
| 0 | 0 | Forward | LED1 → LED2 → … → LED8 |
| 0 | 1 | Reverse | LED8 → LED7 → … → LED1 |
| 1 | 0 | Bounce | LED1 → … → LED8 → … → LED1 |
| 1 | 1 | Reserved | Reserved for future extension |

## Components and Tools

| Item | Specification | Quantity |
|---|---|---:|
| Microcontroller | AT89C51 | 1 |
| LEDs | Standard indicator LEDs | 8 |
| Current-limiting resistors | 330 Ω (verify current for selected LED and supply) | 8 |
| Crystal | 11.0592 MHz | 1 |
| Crystal capacitors | 33 pF (typical starting value) | 2 |
| Mode switches | SPST switches or push buttons | 2 |
| Pull-down resistors | 10 kΩ, if using active-HIGH switch inputs | 2 |
| DC supply | Regulated +5 V | 1 |
| Development IDE | Keil µVision with A51 assembler | — |
| Circuit simulator | Proteus | — |

## Pin Assignment

| AT89C51 pin | Function |
|---|---|
| P2.0 (pin 21) | LED1 |
| P2.1 (pin 22) | LED2 |
| P2.2 (pin 23) | LED3 |
| P2.3 (pin 24) | LED4 |
| P2.4 (pin 25) | LED5 |
| P2.5 (pin 26) | LED6 |
| P2.6 (pin 27) | LED7 |
| P2.7 (pin 28) | LED8 |
| P1.0 (pin 1) | Mode select bit 0 |
| P1.1 (pin 2) | Mode select bit 1 |
| XTAL1, XTAL2 (pins 19, 18) | Crystal oscillator |
| RST (pin 9) | Reset circuit |
| VCC (pin 40) | +5 V |
| GND (pin 20) | Ground |

## Circuit Design Notes

- Connect each LED in series with its own current-limiting resistor. The actual LED polarity determines whether the port uses active-HIGH or active-LOW logic; confirm this in Proteus before finalising the output patterns.
- Use two stable logic-level switch inputs at P1.0 and P1.1. If using mechanical switches, provide defined pull-up or pull-down paths so the inputs do not float.
- Connect the oscillator, reset network, +5 V and ground according to the AT89C51 datasheet and the selected Proteus model.
- Do not connect LEDs in a way that exceeds the per-pin or total-port current limits of the AT89C51. Use driver transistors if the chosen load requires more current.

## Working Principle

The microcontroller writes an 8-bit pattern to Port 2. A single active bit represents the LED that should be illuminated. A software delay keeps each pattern visible before the next one is output.

- **Forward mode:** the active bit progresses from P2.0 to P2.7.
- **Reverse mode:** the active bit progresses from P2.7 to P2.0.
- **Bounce mode:** the active bit travels from P2.0 to P2.7 and then returns to P2.0.

For active-HIGH LED wiring, the forward patterns are:

| LED | P2 value | Binary pattern |
|---:|---:|---|
| 1 | 01H | 00000001 |
| 2 | 02H | 00000010 |
| 3 | 04H | 00000100 |
| 4 | 08H | 00001000 |
| 5 | 10H | 00010000 |
| 6 | 20H | 00100000 |
| 7 | 40H | 01000000 |
| 8 | 80H | 10000000 |

For active-LOW wiring, invert the output patterns (for example, use FEH for LED1 if the other seven LEDs should remain OFF).

## Algorithm

1. Reset the microcontroller and initialise the stack pointer if required by the program.
2. Configure P2 as the LED output port by writing the appropriate idle pattern.
3. Set P1.0 and P1.1 to logic 1 before reading them, as required for 8051 quasi-bidirectional input operation.
4. Read the two mode-select inputs.
5. Branch to the forward, reverse, or bounce routine according to the switch combination.
6. Output the next LED pattern to Port 2.
7. Execute the software delay routine.
8. Repeat the selected sequence while checking the mode inputs at the chosen update point.

## Assembly Program

The final A51 source will be added after the LED polarity, switch wiring, and delay behaviour are verified in Proteus. This avoids publishing an untested program or claiming a simulation result that has not yet been obtained.

## Keil µVision Build Procedure

1. Create a new project and select the AT89C51 device.
2. Add an A51 assembly source file to the project.
3. Enter the verified assembly program and save it.
4. Build the target and resolve any assembler errors.
5. Enable Intel HEX file generation in the target output settings.
6. Locate the generated HEX file in the project's output folder.

## Proteus Simulation Procedure

1. Place the AT89C51, eight LEDs, eight resistors, oscillator components, reset circuit and two mode switches.
2. Wire the LEDs to P2.0–P2.7 and the switches to P1.0 and P1.1.
3. Connect the power, ground, crystal and reset networks.
4. Load the generated HEX file into the AT89C51 component.
5. Set the clock frequency to match the Keil project.
6. Run the simulation and test each switch combination.
7. Capture screenshots of the circuit and each verified lighting mode.

## Verification Checklist

| Test | Expected behaviour | Status |
|---|---|---|
| Forward mode (00) | LED1 to LED8 | Pending |
| Reverse mode (01) | LED8 to LED1 | Pending |
| Bounce mode (10) | LED1 to LED8 and back | Pending |
| Reserved mode (11) | Defined safe/default behaviour | Pending |
| Mode change during operation | Sequence responds according to implementation | Pending |

## Applications

- Running-light and decorative LED displays
- Sequential status indicators
- Basic signalling panels
- Demonstrations of microcontroller GPIO and bit manipulation
- Introductory embedded-systems teaching aids

## Result

The eight-LED sequential lighting controller is specified for implementation using the AT89C51 microcontroller and 8051 Assembly language. The forward, reverse and bounce patterns will be verified using Keil µVision and Proteus. The result and simulation evidence should be updated after successful testing.

## Project Status

- [x] Experiment documentation and I/O plan
- [ ] Assembly source implementation
- [ ] Keil build and HEX generation
- [ ] Proteus circuit and simulation
- [ ] Output screenshots and final verification
