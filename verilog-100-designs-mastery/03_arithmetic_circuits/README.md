# 03 - Arithmetic Circuits (Verilog)

This folder contains **10 essential arithmetic hardware designs**  
implemented in Verilog with a **unified testbench** for validation.

This is Part-3 of the **100 Verilog Designs Mastery Series**.

---

## 📘 Included Modules

| No | Design Name                | File                                | Description |
|----|---------------------------|-------------------------------------|-------------|
| 21 | Ripple Carry Adder        | `21_ripple_carry_adder.v`          | Basic full-adder based adder |
| 22 | Carry Look-Ahead Adder    | `22_carry_look_ahead_adder.v`      | Fast carry generator logic |
| 23 | 4-Bit Multiplier          | `23_4_bit_multiplier.v`            | Multiplication using partial products |
| 24 | Booth Multiplier          | `24_booth_multiplier.v`            | Efficient signed multiplication |
| 25 | Array Multiplier          | `25_array_multiplier.v`            | Regular multiplication structure |
| 26 | Carry Save Adder          | `26_carry_save_adder.v`            | Fast multi-operand addition |
| 27 | Barrel Shifter Left       | `27_barrel_shifter_left.v`         | Multi-bit left shift |
| 28 | Barrel Shifter Right      | `28_barrel_shifter_right.v`        | Multi-bit right shift |
| 29 | Arithmetic Logic Unit     | `29_arithmetic_logic_unit.v`       | Multi-operation arithmetic core |
| 30 | Multiplier Accumulator    | `30_multiplier_accumulator.v`      | MAC for DSP operations |

---

## 🧪 Unified Testbench

Testbench file: **`testbench.v`**

Validates key arithmetic behavior:

✔ Adder correctness  
✔ Faster carry performance  
✔ Multiplier output correctness  
✔ Shift operation verification  
✔ ALU opcode testing  

Generates waveform dump as `waveform.vcd`.

---

## ▶️ Run Simulation (Icarus Verilog)

### **Compile**
```sh
iverilog -o arithmetic.out *.v

Run

vvp arithmetic.out

Waveform

gtkwave waveform.vcd

📂 Folder Structure

03_arithmetic_circuits/
│
├── 21_ripple_carry_adder.v
├── 22_carry_look_ahead_adder.v
├── 23_4_bit_multiplier.v
├── 24_booth_multiplier.v
├── 25_array_multiplier.v
├── 26_carry_save_adder.v
├── 27_barrel_shifter_left.v
├── 28_barrel_shifter_right.v
├── 29_arithmetic_logic_unit.v
├── 30_multiplier_accumulator.v
│
└── testbench.v

🚀 Learning Outcomes

✔ Adder architecture comparison
✔ Speed vs area trade-offs
✔ Multiplier implementation concepts
✔ Shift-based operations
✔ Verification-driven development

If this helped you, ⭐ star the repo and follow the learning journey!

---