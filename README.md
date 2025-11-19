# 100 Verilog Designs Mastery

A complete end-to-end implementation repository to master **RTL Design + Verilog + Digital Logic** using 100 real hardware modules.

This repo is built for **VLSI, ASIC, and FPGA design roles**, with a focus on full practical learning through **design → simulation → waveform analysis → verification mindset**.

---

## 🧠 What This Repository Covers

This repository contains **100 Verilog HDL designs**, categorized from beginner-friendly modules to complex industry-level RTL blocks.

Each design includes:
- RTL Code (clean + synthesizable)
- Testbench
- Waveform results
- Explanation (logic + equations)
- Interview points
- Common mistakes & debugging notes

---

## 🎯 Skill Outcomes After Completing All 100 Designs

### Verilog HDL (Beginner → Advanced)
- Procedural blocks, blocking vs non-blocking
- FSM design (Moore & Mealy)
- Counters, registers, shift registers
- Combinational & sequential logic mastery
- Testbench writing
- Waveform debugging

### RTL Design Thinking
- Clean hierarchical design
- Synthesizable coding style
- Timing-aware design (setup/hold mindset)
- Finite state machines (industry style)

### Verification Mindset (mini-UVM style)
- Stimulus generation
- Self-checking TB mindset
- Assertion-style checks
- Coverage mindset (functional scenarios)

---

## 📁 Repository Structure

```
100-verilog-designs-mastery/
│
├── 01_basic_gates/
├── 02_combinational_circuits/
├── 03_arithmetic_circuits/
├── 04_mux_decoder_encoder/
├── 05_comparators_parity/
├── 06_sequential_circuits/
├── 07_registers_counters/
├── 08_fsm_designs/
├── 09_memory_and_interface/
├── 10_advanced_rtl_blocks/
│
└── docs/ (explanations, notes, diagrams)
```

Each folder contains:
```
module.v        → RTL
module_tb.v     → Testbench
waveform.png    → Simulation output
readme.md       → Block explanation
```

---

## 🔥 Category-wise List of All 100 Designs

### 1️⃣ Basic Logic Blocks (10 designs)
- AND, OR, XOR, NOT
- Half Adder, Full Adder
- Half Subtractor, Full Subtractor
- 4-bit Ripple Carry Adder
- 4-bit Comparator

### 2️⃣ Combinational Circuits (12 designs)
- 2:1, 4:1, 8:1 MUX
- 1:4, 1:8 DEMUX
- Binary Encoder, Priority Encoder
- Parity generator/checker
- 4-bit ALU (basic)

### 3️⃣ Arithmetic & Logic Units (10 designs)
- 8-bit ALU
- Carry Look-Ahead Adder
- Barrel Shifter
- Arithmetic Shifter
- Multiplier (array)
- Divider (restoring)

### 4️⃣ Sequential Circuits (20 designs)
- SR, JK, D, T Flip-Flops
- Latches
- Level/edge triggered FFs
- Moore/Mealy template modules
- Pulse detector
- Frequency divider

### 5️⃣ Registers & Counters (15 designs)
- PIPO, PISO, SIPO, SISO
- Ring counter
- Johnson counter
- Up, Down, Up-Down counters
- Mod-N counter
- Debouncing circuit

### 6️⃣ FSM Designs (15 designs)
- Traffic Light Controller
- Sequence Detector (1011, 1101, etc.)
- Elevator Controller
- Vending Machine FSM
- Parking Gate Controller
- UART Tx FSM

### 7️⃣ Memory & Bus Interface (8 designs)
- Simple RAM
- ROM (lookup table)
- FIFO (sync)
- Handshake protocols
- APB lite slave
- UART Tx/Rx RTL

### 8️⃣ Advanced RTL Designs (10 designs)
- 5-stage ALU
- Round Robin Arbiter
- Priority Arbiter
- Timer/Watchdog
- Digital Clock
- Mini CPU (tiny instruction set)
- CRC Generator
- LFSR (random generator)

---

## 🛠️ Tools Used
- Icarus Verilog / QuestaSim / ModelSim
- GTKWave
- VS Code

---

## 📌 How to Run Any Design

```
iverilog module.v module_tb.v -o out
./out
gtkwave dump.vcd
```

---

## 📚 Methodology Used

Each design is created using a structured approach:
1. Understand logic (truth table/equation)
2. Create block diagram
3. Write synthesizable RTL
4. Build clean testbench
5. Simulate & analyze waveform
6. Write interview-oriented summary
7. Document common mistakes

---

## ⭐ Interview Value

Completing these designs boosts confidence for:
- Digital logic rounds
- RTL coding tests
- FSM design questions
- Debugging & timing questions

Useful for companies like:
**Qualcomm, Nvidia, Intel, AMD, TI, Micron, NXP, Samsung, Broadcom, MediaTek, Synopsys, Cadence, Marvell.**

---

## 🤝 Contributions
Contributions for new designs, optimizations, or documentation improvements are welcome.

---

## 📄 License
Copyright (c) 2025 Brahma Ganesh Katrapalli
Email: katrapallibrahmaganesh@gmail.com

---