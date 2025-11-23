# 04 - MUX, DEMUX, Decoder & Encoder (Verilog)

This folder contains **10 important digital combinational circuits**  
designed in Verilog with a **unified testbench** for validation.

This is Part-4 of the **100 Verilog Designs Mastery Series**.

---

## 📘 Included Modules

| No | Design Name                  | File                        | Description |
|----|------------------------------|----------------------------|-------------|
| 31 | 2×1 Multiplexer              | `31_2_1_mux.v`             | Selects between 2 inputs |
| 32 | 4×1 Multiplexer              | `32_4_1_mux.v`             | Selects between 4 inputs |
| 33 | 8×1 Multiplexer              | `33_8_1_mux.v`             | Selects between 8 inputs |
| 34 | 16×1 Multiplexer             | `34_16_1_mux.v`            | Selects between 16 inputs |
| 35 | 1×2 Demultiplexer            | `35_1_2_demux.v`           | Routes input to 2 outputs |
| 36 | 1×4 Demultiplexer            | `36_1_4_demux.v`           | Routes input to 4 outputs |
| 37 | 2×4 Decoder                  | `37_2_4_decoder.v`         | 2-to-4 line decoder |
| 38 | 3×8 Decoder                  | `38_3_8_decoder.v`         | 3-to-8 line decoder |
| 39 | 8×3 Encoder                  | `39_8_3_encoder.v`         | Encodes active-high input |
| 40 | 8×3 Priority Encoder         | `40_priority_encoder.v`    | Highest input has priority |

---

## 🧪 Unified Testbench

Testbench file: `testbench.v`

Validates complete functionality:

✔ MUX selection behavior  
✔ DEMUX line activation  
✔ Decoder output one-hot correctness  
✔ Encoder recognition  
✔ Priority resolver correctness  

Outputs include:  
- `$monitor` value tracing  
- `$display` functional logs  
- Waveform generation (`waveform.vcd`)

---

## ▶️ Run Simulation (Icarus Verilog)

### **Compile**
```sh
iverilog -o mux_enc.out *.v

Run

vvp mux_enc.out

Open Waveform

gtkwave waveform.vcd

📂 Folder Structure

04_mux_decoder_encoder/
│
├── 31_2_1_mux.v
├── 32_4_1_mux.v
├── 33_8_1_mux.v
├── 34_16_1_mux.v
├── 35_1_2_demux.v
├── 36_1_4_demux.v
├── 37_2_4_decoder.v
├── 38_3_8_decoder.v
├── 39_8_3_encoder.v
├── 40_priority_encoder.v
│
└── testbench.v

## 🧪 Expected Simulation Output


=== Starting unified testbench ===

=== MUX tests ===
(sel changes, outputs updated...)

=== DEMUX tests ===
(valid routing observed)

=== DECODER tests ===
(one-hot output switching correct)

=== ENCODER tests ===
(single input bit → correct encoding)

=== Priority encoder with multiple bits ===
(highest priority bit → correct index)

=== Testbench finished ===

✔ All designs compiled and simulated successfully in VCS  
✔ Functional behavior verified

---

## 📈 Learning Outcomes

✔ Combinational design fundamentals  
✔ Case statements & conditional assignments  
✔ Priority vs standard encoding  
✔ Verification methodology basics  

---
If you find this helpful, ⭐ star the repo and follow the journey.  