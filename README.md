# Traffic Light Controller 🚦

A digital traffic light controller designed using **Verilog HDL** and implemented on an **Intel Agilex 3 FPGA** using **Quartus Prime**.

## 📌 Project Overview

This project implements a basic traffic light controller using a **Finite State Machine (FSM)**. The controller operates through three states:

- 🔴 RED
- 🟢 GREEN
- 🟡 YELLOW

The current state is stored in a state register. Based on the current state, combinational logic determines the next state and controls the corresponding LED output.

## ⚙️ Working Principle

The controller uses a **3-state FSM**:

```text
        ┌─────────┐
        │   RED   │
        └────┬────┘
             ↓
        ┌─────────┐
        │  GREEN  │
        └────┬────┘
             ↓
        ┌─────────┐
        │ YELLOW  │
        └────┬────┘
             │
             └────────→ RED
🎯 Objectives

The main objectives of this project are:

Design a traffic light controller using Verilog HDL.
Implement the controller using a 3-state FSM.
Generate appropriate RED, YELLOW, and GREEN outputs.
Control state transitions using a clock signal.
Implement reset functionality.
Simulate the design using a Verilog simulator.
Synthesize and implement the design on an FPGA.
Verify the traffic light sequence using FPGA LEDs.

⚙️ Features
3-state FSM architecture
Synthesizable Verilog HDL
Programmable timing parameters
Synchronous digital design
Reset functionality
Separate RED, YELLOW, and GREEN outputs
Simulation testbench included
FPGA implementation
Suitable for learning FSM-based digital design
🧠 FSM Design

The controller consists of three states.

State	Traffic Light	Output
GREEN	🟢 Green ON	001
YELLOW	🟡 Yellow ON	010
RED	🔴 Red ON	100

Only one traffic light is active at a time.

State Transition
             Timer Complete
        ┌──────────────────────┐
        │                      ▼
    ┌────────┐             ┌─────────┐
    │ GREEN  │────────────►│ YELLOW  │
    └────────┘             └─────────┘
        ▲                       │
        │                       │ Timer Complete
        │                       ▼
        │                   ┌────────┐
        └───────────────────│  RED   │
                            └────────┘
                             Timer
                            Complete
🔌 Inputs and Outputs
Inputs
Signal	Description
clk	FPGA system clock
reset	Resets the FSM to the initial state

Outputs
Signal	Description
red	Controls red traffic light
yellow	Controls yellow traffic light
green	Controls green traffic light

🏗️ Block Diagram
                 ┌─────────────────┐
                 │   FPGA Clock    │
                 │      (clk)      │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │  Clock Counter  │
                 │    / Timer      │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │   3-State FSM   │
                 │                 │
                 │ GREEN           │
                 │ YELLOW          │
                 │ RED             │
                 └────────┬────────┘
                          │
             ┌────────────┼────────────┐
             ▼            ▼            ▼
          ┌──────┐    ┌────────┐    ┌───────┐
          │ GREEN│    │ YELLOW │    │  RED  │
          │ LED  │    │  LED   │    │  LED  │
          └──────┘    └────────┘    └───────┘
💻 Technologies Used
Verilog HDL
Intel/Altera FPGA
Quartus Prime
ModelSim / Questa
FPGA development board
