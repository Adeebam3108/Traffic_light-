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
