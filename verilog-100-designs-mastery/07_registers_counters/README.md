# 🚀 07 - Registers & Counters (Verilog)

This folder contains **10 essential register and counter designs** implemented in Verilog/SystemVerilog, along with a **unified testbench**.

This is Part-7 of the **100 Verilog Designs Mastery Series**.

---

## 📘 Included Modules

| No | Design Name               | File                             | Description |
|----|---------------------------|----------------------------------|-------------|
| 61 | Universal Shift Register  | `61_universal_shift_register.v`  | 4-bit shift register supporting hold, left, right, and parallel load |
| 62 | PISO Register             | `62_piso_register.v`             | Parallel-In Serial-Out shift register |
| 63 | SIPO Register             | `63_sipo_register.v`             | Serial-In Parallel-Out shift register |
| 64 | Ring Counter              | `64_ring_counter.v`              | 4-bit rotating one-hot ring counter |
| 65 | Johnson Counter           | `65_Johnson_counter.v`           | 4-bit twisted ring/Johnson counter |
| 66 | PIPO Register             | `66_pipo_register.sv`            | Simple 4-bit parallel-in parallel-out register |
| 67 | Up Counter                | `67_up_counter.v`                | 4-bit synchronous increment counter |
| 68 | Down Counter              | `68_down_counter.v`              | 4-bit synchronous decrement counter |
| 69 | Up-Down Counter           | `69_up_down_counter.v`           | Counter with direction control |
| 70 | Mod-10 Decade Counter     | `70_mod_10_decade_counter.v`     | Counter that cycles repeatedly from 0 → 9 |

---

## 🧪 Unified Testbench

**File:** `testbench.v`

### ✔ Testbench Validates:

### 🔹 Registers  
- Universal Shift Register → hold, left shift, right shift, parallel load  
- PISO → serial shifting  
- SIPO → serial-to-parallel capture  
- PIPO → direct parallel register  
- Ring Counter → 1-hot rotation  
- Johnson Counter → twisted ring behavior  

### 🔹 Counters  
- Up counter  
- Down counter  
- Up-Down counter (direction switching)  
- Mod-10 decade counter rollover behavior  

### ✔ Testbench Features  
- Clock generator  
- Active-low reset  
- Task-based testing  
- `$monitor` & `$display`  
- Generates `waveform.vcd`  

---

## ▶️ Run Simulation (Icarus Verilog)

### **Compile**
```sh
iverilog -o reg_counter.out *.v *.sv

Run

vvp reg_counter.out

Open Waveform

gtkwave waveform.vcd

📂 Folder Structure

07_registers_counters/
│
├── 61_universal_shift_register.v
├── 62_piso_register.v
├── 63_sipo_register.v
├── 64_ring_counter.v
├── 65_Johnson_counter.v
├── 66_pipo_register.sv
├── 67_up_counter.v
├── 68_down_counter.v
├── 69_up_down_counter.v
├── 70_mod_10_decade_counter.v
│
├── testbench.v
└── README.md

🧪 Expected Simulation Output

=== Starting Registers & Counters Testbench ===

-- Register Tests --
USR : Hold, Left, Right, Load OK
PISO : Serial shifting OK
SIPO : Parallel output OK
PIPO : Storage OK
Ring Counter : 1-hot rotation OK
Johnson Counter : Twisted sequence OK

-- Counter Tests --
Up Counter : Increment OK
Down Counter : Decrement OK
Up-Down Counter : Direction switch OK
Decade Counter : Mod-10 reset OK

=== All tests completed successfully ===

📈 Learning Outcomes

✔ Understand shift registers (PISO, SIPO, PIPO, Universal)
✔ Master ring and Johnson counters
✔ Learn up/down/mod-N counters
✔ Build reusable testbenches
✔ Improve debugging with waveform analysis

---