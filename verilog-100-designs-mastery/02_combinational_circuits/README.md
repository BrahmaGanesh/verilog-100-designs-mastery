# 02 - Combinational Circuits (Verilog)

This folder contains **10 essential combinational Verilog designs**,  
each implemented using clean RTL logic and validated using a **single unified testbench**.

This is **Part-2 of the 100 Verilog Designs Mastery Series**.

---

## 📘 Included Modules

| No | Design Name                | File                                | Description |
|----|----------------------------|-------------------------------------|-------------|
| 11 | Half Adder                | `11_half_adder.v`                   | Sum + Carry |
| 12 | Full Adder                | `12_full_adder.v`                   | 3-input adder |
| 13 | Half Subtractor           | `13_half_subtractor.v`              | Diff + Borrow |
| 14 | Full Subtractor           | `14_full_subtractor.v`              | 3-input subtractor |
| 15 | 4-bit Adder               | `15_4_bit_addr.v`                   | Ripple adder |
| 16 | 4-bit Subtractor          | `16_4_bit_subtractor.v`             | Borrow-based subtractor |
| 17 | 4-bit Adder-Subtractor    | `17_4_bit_adder_subtractor.v`       | Mode-based add/sub |
| 18 | 4-bit Comparator          | `18_4_bit_comparator.v`             | Less/Equal/Greater comparison |
| 19 | 4-bit Priority Encoder    | `19_4_bit_priority_encoder.v`       | Encodes highest active bit |
| 20 | 4-bit Parity Generator    | `20_4_bit_parity_generator.v`       | Even/Odd parity generation |

---

## 🧪 Unified Testbench

All modules are tested using **one single testbench**:

testbench.v

The testbench prints:

- Truth-table-like results  
- Clean `$display` formatted tables  
- Waveform dump (`waveform.vcd`)  

Works on **Icarus, VCS, QuestaSim, Verilator**.

---

## ▶️ How to Run (Icarus Verilog)

### **Compile**
```sh
iverilog -o combo.out *.v

Run
vvp combo.out

View waveform

gtkwave waveform.vcd

📂 Folder Structure

02_combinational_circuits/
│
├── 11_half_adder.v
├── 12_full_adder.v
├── 13_half_subtractor.v
├── 14_full_subtractor.v
├── 15_4_bit_addr.v
├── 16_4_bit_subtractor.v
├── 17_4_bit_adder_subtractor.v
├── 18_4_bit_comparator.v
├── 19_4_bit_priority_encoder.v
├── 20_4_bit_parity_generator.v
│
└── testbench.v

✔ Example Simulation Output

==================== FULL ADDER ====================
A B Cin | Sum Carry
0 1  0  |  1    0
1 1  1  |  1    1

==================== HALF ADDER ====================
A B | Sum Carry
1 0 |  1    0

==================== 4-BIT ADDER ====================
1010 + 0101 = 1111, Carry = 0

==================== COMPARATOR ====================
A=5, B=5 → equal=1, less=0, greater=0


---