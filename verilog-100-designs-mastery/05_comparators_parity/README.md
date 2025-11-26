# 05 - Comparators & Parity Circuits (Verilog)

This folder contains **10 essential comparison and parity circuits**  
implemented in Verilog with a **unified testbench** for verification.

This is Part-5 of the **100 Verilog Designs Mastery Series**.

---

## 📘 Included Modules

| No | Design Name               | File                            | Description |
|----|----------------------------|---------------------------------|-------------|
| 41 | 1-bit Comparator           | `41_1_bit_comparator.v`         | Compares single-bit A & B |
| 42 | 2-bit Comparator           | `42_2_bit_comparator.v`         | Compares 2-bit numbers |
| 43 | 4-bit Comparator           | `43_4_bit_comparator.v`         | Compares 4-bit numbers |
| 44 | Odd Parity Generator       | `44_odd_parity_generator.v`     | Generates odd parity bit |
| 45 | Even Parity Generator      | `45_even_parity_generator.v`    | Generates even parity bit |
| 46 | Parity Checker             | `46_parity_checker.v`           | Checks even/odd parity |
| 47 | Magnitude Comparator       | `47_magnitude_comparator.v`     | A>B, A<B, A==B detection |
| 48 | Equality Comparator        | `48_equality_comparator.v`      | Checks A == B |
| 49 | Zero Detector              | `49_zero_detector.v`            | Detects zero input |
| 50 | Overflow Detector          | `50_overflow_detector.v`        | Detects signed overflow |

---

## 🧪 Unified Testbench

Testbench file: **`testbench.v`**

Verifies all modules in a single run:

### Comparator Tests
- 1-bit, 2-bit, 4-bit comparison  
- Tests for A>B, A<B, A==B  
- Boundary checks (0, max, mid values)

### Parity Circuit Tests
- Odd/Even parity generation  
- Parity error detection  
- All combinations validated

### Detector Tests
- Zero detection accuracy  
- Signed overflow test validation (POS+POS, NEG+NEG)

The testbench includes:
- `$monitor` logging  
- `$display` summaries  
- `waveform.vcd` dump for GTKWave  
- Modular test procedures  

---

## ▶️ Run Simulation (Icarus Verilog)

### **Compile**
```sh
iverilog -o comparators_parity.out *.v

Run

vvp comparators_parity.out

Open Waveform

gtkwave waveform.vcd

📂 Folder Structure

05_comparators_parity/
│
├── 41_1_bit_comparator.v
├── 42_2_bit_comparator.v
├── 43_4_bit_comparator.v
├── 44_odd_parity_generator.v
├── 45_even_parity_generator.v
├── 46_parity_checker.v
├── 47_magnitude_comparator.v
├── 48_equality_comparator.v
├── 49_zero_detector.v
├── 50_overflow_detector.v
│
├── testbench.v
└── README.md

🧪 Expected Simulation Output

=== Starting Unified Testbench ===

-- Comparator Tests --
Correct comparison outputs for all bit-widths

-- Parity Tests --
Odd/Even parity verified
Parity checker correctly detects errors

-- Detector Tests --
Zero Detector works for all inputs
Signed Overflow Detector validated successfully

=== All tests completed ===

📈 Learning Outcomes

✔ Comparator logic design
✔ Odd/Even parity generation
✔ Digital error-checking via parity
✔ Zero & overflow detection
✔ Multi-module verification techniques
✔ Writing clean, scalable Verilog

---
