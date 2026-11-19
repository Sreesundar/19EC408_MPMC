# Microprocessors and Microcontrollers Laboratory



A collection of laboratory experiments for **19EC408 – Microprocessors and Microcontrollers**. This repository documents assembly-language programming, microcontroller fundamentals, peripheral interfacing, and basic embedded-system applications using the **8086**, **8051 family**, and **STM32** platforms.

Each experiment is maintained as an individual Markdown document and may include its aim, required apparatus, algorithm, program, circuit connections, flowchart, calculations, and observed output.

## Contents

- [Experiments](#experiments)
- [Platforms and tools](#platforms-and-tools)
- [Getting started](#getting-started)
- [Repository structure](#repository-structure)
- [Notes before running the programs](#notes-before-running-the-programs)
- [Learning outcomes](#learning-outcomes)

## Experiments

| No. | Experiment | Platform | Language | Documentation |
|---:|---|---|---|---|
| 01 | Arithmetic operations: addition, subtraction, multiplication, and division | Intel 8086 | Assembly | [View experiment](./exp01-Arithmetic-operation-using-8086.md) |
| 02 | Stepper motor interfacing and switching sequence | Intel 8086 | Assembly | [View experiment](./exp02-STEPPER-MOTOR-INTERFACING.md) |
| 03 | Square and cube of a number | 8051 | Assembly | [View experiment](./exp03-Square-Cube-of-a-number-using-8051.md) |
| 04 | DAC interfacing and square/sawtooth waveform generation | Intel 8086 | Assembly | [View experiment](./exp04-DAC.md) |
| 05 | Sorting numbers in ascending and descending order | 8051 | Assembly | [View experiment](./exp05-sorting-of-numbers.md) |
| 06 | Factorial of a number | 8051 | Assembly | [View experiment](./exp06-FACTORIAL-OF-A-NUMBER.md) |
| 10 | STM32 GPIO demonstration (LED/sensor documentation and display code) | STM32 | Embedded C (HAL) | [View experiment](./exp10-LED-BLINK.md) |
| 11 | Push-button-controlled buzzer and speaker | AT89C51 | Embedded C | [View experiment](./exp11-Push-Button-Controlled-Buzzer-and-Speaker-Using-AT89C51-Microcontroller.md) |

> **Repository scope:** The current repository contains the experiment records listed above (01–06, 10, and 11). The numbering follows the lab records; it does not imply that every experiment number is present.

## Platforms and tools

| Platform | Topics covered | Tools / environment referenced in the lab records |
|---|---|---|
| Intel 8086 | Arithmetic instructions, memory operations, stepper-motor interfacing, DAC output | MASM and 8086 microprocessor kit |
| 8051 | Arithmetic routines, sorting, factorial | Keil µVision |
| AT89C51 | Digital input/output and buzzer/speaker control | 8051-compatible Embedded C toolchain (`reg51.h`) |
| STM32 | GPIO and peripheral-control example using the Hardware Abstraction Layer | STM32 HAL project environment |

The exact board, compiler, simulator, memory map, and pin configuration can vary by experiment. Refer to the individual experiment document before setting up a project.

## Getting started

### 1. Clone the repository

```bash
git clone https://github.com/Sreesundar/19EC408_MPMC.git
cd 19EC408_MPMC
```

### 2. Open an experiment

Choose an experiment from the [table above](#experiments) and open its Markdown file. The source code and any available diagrams, circuit details, calculations, or output images are included in that document.

### 3. Set up the matching environment

- **8086 programs:** Use an 8086-compatible assembler or the MASM environment specified in the experiment. Configure the memory locations and I/O port addresses exactly as required by the program and training kit.
- **8051 programs:** Create an 8051 project in Keil µVision (or a compatible toolchain), select the appropriate device, and load the program into the simulator or target board.
- **AT89C51 program:** Use an 8051-compatible C compiler that provides the `reg51.h` device header. Reproduce the documented circuit and pin connections before testing on hardware.
- **STM32 program:** Use a matching STM32 HAL project and device configuration. The experiment document contains a code listing; it is not a complete, ready-to-build STM32 project by itself.

### 4. Build and verify

Assemble or compile the program in the selected environment, then verify its behaviour using the simulator, microprocessor kit, or circuit setup described in the experiment. Check the expected memory locations, output ports, waveforms, or peripheral responses where applicable.

## Repository structure

```text
19EC408_MPMC/
├── README.md
├── exp01-Arithmetic-operation-using-8086.md
├── exp02-STEPPER-MOTOR-INTERFACING.md
├── exp03-Square-Cube-of-a-number-using-8051.md
├── exp04-DAC.md
├── exp05-sorting-of-numbers.md
├── exp06-FACTORIAL-OF-A-NUMBER.md
├── exp10-LED-BLINK.md
└── exp11-Push-Button-Controlled-Buzzer-and-Speaker-Using-AT89C51-Microcontroller.md
```

## Notes before running the programs

- These are educational lab examples, not production-ready firmware. Review the program and hardware requirements before execution.
- Assembly programs depend on the target processor, assembler syntax, register usage, memory locations, and I/O addresses. Do not assume that an 8086 program can run on an 8051, or vice versa.
- Hardware experiments require the correct supply voltage, common ground, interface circuitry, and pin mapping. Check the circuit document before connecting components.
- **Experiment 03:** The written algorithm refers to Port 0 and Port 2, while the supplied assembly listing accesses internal RAM through `R0`. Confirm the intended input/output method before running it.
- **Experiment 10:** The document describes sensor-based LED control, but the displayed code cycles through seven-segment digit patterns on GPIOA pins. Its GPIO initialisation and stated sensor behaviour should be reconciled before treating it as a verified sensor-controlled LED implementation.
- Output images and measured values are included where available. Results may differ with clock frequency, board configuration, simulator settings, and connected hardware.

## Learning outcomes

Working through these experiments provides practice with:

- Writing and tracing 8086 and 8051 assembly programs.
- Using registers, memory locations, arithmetic instructions, loops, and conditional branches.
- Interfacing peripherals such as stepper motors and DACs.
- Generating and observing basic analog waveforms.
- Implementing simple embedded-C input/output control on microcontrollers.
- Reading circuit connections, checking outputs, and debugging hardware/software interactions.

---

**Repository:** [Sreesundar/19EC408_MPMC](https://github.com/Sreesundar/19EC408_MPMC)
