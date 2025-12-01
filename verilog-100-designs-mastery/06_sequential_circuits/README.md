# 06 - Latches, Flip-Flops & Detectors (Verilog)

This folder contains **10 essential sequential logic circuits** implemented in Verilog with a **unified testbench**.

This is Part-6 of the **100 Verilog Designs Mastery Series**.

---

## 📘 Included Modules

| No | Design Name                  | File                           | Description |
|----|------------------------------|--------------------------------|-------------|
| 51 | SR Latch                     | `51_sr_latch.v`                | Basic Set-Reset latch using NOR/NAND |
| 52 | D Latch                      | `52_d_latch.v`                 | Level-sensitive latch |
| 53 | JK Flip-Flop                 | `53_jk_flip_flop.v`            | Clocked JK behavior with toggle state |
| 54 | D Flip-Flop                  | `54_d_flip_flop.v`             | Positive-edge triggered |
| 55 | T Flip-Flop                  | `55_t_flip_flop.v`             | Toggle flip-flop |
| 56 | Master-Slave JK Flip-Flop    | `56_master_slave_jk_ff.v`      | Glitch-free JK FF (Master-Slave design) |
| 57 | Pulse Detector               | `57_pulse_detector.v`          | Detects short high-level pulses |
| 58 | Edge Detector                | `58_edge_detector.v`           | Rising / Falling / Both-edge detection |
| 59 | Schmitt Trigger              | `59_schmitt_trigger.v`         | Hysteresis-based digital noise filter |
| 60 | Synchronizer (2-FF)          | `60_synchronizer.v`            | Metastability protection for async signals |

---

## 🧪 Unified Testbench

Testbench file: **`testbench.v`**

### Testbench Covers:

- SR Latch truth table
- D Latch transparency behavior (enable = 0/1)
- JK Flip-Flop toggle, hold, reset
- D Flip-Flop edge-triggered behavior
- T Flip-Flop toggle verification
- Master–slave JK glitch-free operation
- Pulse detector short pulse detection
- Rising/Falling/Both-edge detection
- Schmitt trigger noise filtering
- Synchronizer metastability handling

The testbench provides:

- `$monitor` & `$display` logs  
- `waveform.vcd` generation  
- Clock generator  
- Modular test procedures  

---

## ▶️ Run Simulation (Icarus Verilog)

### **Compile**
```sh
iverilog -o seq_designs.out *.v

Run

vvp seq_designs.out

Open Waveform

gtkwave waveform.vcd

📂 Folder Structure

06_latches_flipflops_detectors/
│
├── 51_sr_latch.v
├── 52_d_latch.v
├── 53_jk_flip_flop.v
├── 54_d_flip_flop.v
├── 55_t_flip_flop.v
├── 56_master_slave_jk_ff.v
├── 57_pulse_detector.v
├── 58_edge_detector.v
├── 59_schmitt_trigger.v
├── 60_synchronizer.v
│
├── testbench.v
└── README.md

🧪 Expected Simulation Output

=== Starting Sequential Logic Testbench ===

-- Latch Tests --
SR Latch OK
D Latch transparency OK

-- Flip-Flop Tests --
JK FF toggle verified
D FF edge-trigger verified
T FF toggle verified
Master-Slave JK stable output OK

-- Detector Tests --
Pulse detection successful
Edge detection validated
Schmitt trigger noise filtered
Synchronizer working correctly

=== All tests completed successfully ===

📈 Learning Outcomes

✔ Sequential logic fundamentals
✔ Latch vs Flip-Flop behavior differences
✔ Timing, edges, and metastability
✔ Pulse & edge detection design
✔ Master–slave architecture
✔ Unified sequential testbench writing

---