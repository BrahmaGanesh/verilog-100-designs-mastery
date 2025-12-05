# **Advanced RTL Blocks (91–100) — Verilog Implementation**

This directory contains **10 advanced RTL design modules** written in Verilog, along with a **unified testbench** to verify all blocks.
These designs cover key concepts used in **ASIC / FPGA Digital Design, RTL Design, and Verification**.

---

## 📁 **List of RTL Modules (91–100)**

| No. | Module Name                    | File                                 |
| --- | ------------------------------ | ------------------------------------ |
| 91  | PWM Generator                  | `91_pwm_generator.v`                 |
| 92  | Digital Filter (FIR)           | `92_digital_filter.v`                |
| 93  | Debouncer                      | `93_debouncer.v`                     |
| 94  | Clock Divider                  | `94_clock_divider.v`                 |
| 95  | ALU With Flags                 | `95_alu_with_flags.v`                |
| 96  | Timer Module                   | `96_timer_module.v`                  |
| 97  | CRC-8 Generator                | `97_crc_generator.v`                 |
| 98  | CRC-8 Checker                  | `98_crc_checker.v`                   |
| 99  | Priority Arbiter               | `99_priority_arbiter.v`              |
| 100 | Simple Wishbone / AHB-like Bus | `100_wishbone_AHB_like_simple_bus.v` |

---

## 🧪 **Testbench**

A single testbench (`testbench.v`) is provided which:

* Instantiates all 10 modules
* Generates clock + reset
* Applies stimulus to every design
* Prints execution logs
* Simulates full functional behavior of all RTL blocks

---

## ⚙️ **Simulation Instructions**

### **Compile**

```
iverilog -o advanced_rtl_tb \
91_pwm_generator.v \
92_digital_filter.v \
93_debouncer.v \
94_clock_divider.v \
95_alu_with_flags.v \
96_timer_module.v \
97_crc_generator.v \
98_crc_checker.v \
99_priority_arbiter.v \
100_wishbone_AHB_like_simple_bus.v \
testbench.v
```

### **Run**

```
vvp advanced_rtl_tb
```

### **(Optional) View Waveforms**

```
gtkwave dump.vcd
```

---

## 📘 **Description of Each Block (Short Summary)**

### **91 — PWM Generator**

Generates Pulse-Width Modulated output based on an 8-bit duty cycle.

### **92 — Digital FIR Filter**

Implements a moving-average FIR filter with parameterizable taps.

### **93 — Debouncer**

Removes glitches/noise from mechanical switch input.

### **94 — Clock Divider**

Generates divided clock using a counter method.

### **95 — ALU With Flags**

Performs arithmetic and logic operations with Zero, Carry, Negative, and Overflow flags.

### **96 — Timer Module**

Counts clock cycles and asserts `timeout` at terminal count.

### **97 — CRC-8 Generator**

Shift-register based polynomial CRC generator.

### **98 — CRC-8 Checker**

Validates incoming CRC bit-stream and reports error.

### **99 — Priority Arbiter**

Fixed-priority encoder for multi-master request-grant.

### **100 — Simple Bus (Wishbone/AHB-like)**

Minimal bus with address, write/read, and ready/valid handshake.

---

## 📂 **Directory Structure**

```
10_advanced_rtl_blocks/
│
├── 91_pwm_generator.v
├── 92_digital_filter.v
├── 93_debouncer.v
├── 94_clock_divider.v
├── 95_alu_with_flags.v
├── 96_timer_module.v
├── 97_crc_generator.v
├── 98_crc_checker.v
├── 99_priority_arbiter.v
├── 100_wishbone_AHB_like_simple_bus.v
│
├── testbench.v
└── README.md
```

---

## ⭐ **Purpose**

This collection helps you master:

* RTL design
* Synchronous logic
* Filters, timers, ALUs
* CRC concepts
* Bus protocols
* Clocking, resets
* Verification basics using a unified testbench

Perfect for beginners to advanced RTL / DV learners.

---
