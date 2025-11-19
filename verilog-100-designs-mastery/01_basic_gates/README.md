# 01 - Basic Logic Gates (Verilog)

This folder contains **10 essential Verilog gate-level + behavioral models**  
along with a **single unified testbench** that tests all modules together.

This is Part-1 of the **100 Verilog Designs Mastery Series**.

---

## 📘 Included Modules

| No | Design Name                | File                           | Description |
|----|----------------------------|--------------------------------|-------------|
| 1  | NOT Gate                   | `NOT_gate.v`                   | Inverter |
| 2  | AND Gate                   | `AND_gate.v`                   | 2-input AND |
| 3  | OR Gate                    | `OR_gate.v`                    | 2-input OR |
| 4  | NAND Gate                  | `NAND_gate.v`                  | 2-input NAND |
| 5  | NOR Gate                   | `NOR_gate.v`                   | 2-input NOR |
| 6  | XOR Gate                   | `XOR_gate.v`                   | 2-input XOR |
| 7  | XNOR Gate                  | `XNOR_gate.v`                  | 2-input XNOR |
| 8  | Buffer                     | `buffer.v`                     | Logical buffer |
| 9  | 2-input Combination Logic  | `2_input_gate_combo.v`         | Custom combo logic |
| 10 | 4-input Universal Gate     | `4_input_universal_gate.v`     | NAND/NOR universal gate |

---

## 🧪 Testbench

All designs are validated using **one testbench file**:


The testbench prints:

- Truth tables  
- Signal changes (via `$monitor`)  
- Waveforms (`waveform.vcd`)  

---

## ▶️ How to Run (Icarus Verilog)

### **Compile all files**

iverilog -o gates.out *.v


### **Run simulation**

vvp gates.out


### **Open waveform**

gtkwave waveform.vcd



---

## 📂 Folder Structure

01_basic_gates/
│
├── AND_gate.v
├── OR_gate.v
├── NOT_gate.v
├── NAND_gate.v
├── NOR_gate.v
├── XOR_gate.v
├── XNOR_gate.v
├── buffer.v
├── 2_input_gate_combo.v
├── 4_input_universal_gate.v
│
└── testbench.v



---

## ✔ Simulation Output (Expected)

TIME | A B C D | NOT AND OR NAND NOR XOR XNOR BUF CMB NR4
-----------------------------------------------------------
  0  | 0 0 0 0 | 1   0   0   1   1   0   1   0   0   1
 10  | 0 1 1 0 | 1   0   1   1   0   1   0   0   1   0
 20  | 1 0 1 1 | 0   0   1   1   0   1   0   1   1   0
 30  | 1 1 0 1 | 0   1   1   0   0   0   1   1   1   0


This matches verified logic for all gates.

---
