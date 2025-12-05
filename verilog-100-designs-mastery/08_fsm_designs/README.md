🚀 08 - FSM Designs (Verilog)

This folder contains 10 essential FSM-based designs, including sequence detectors, controllers, vending/lift machines, and UART Tx/Rx — all implemented in Verilog.

This is Part-8 of the 100 Verilog Designs Mastery Series.

## 📘 Included Modules

| No | Design Name                | File                            | Description                                       |
| -- | -------------------------- | ------------------------------- | ------------------------------------------------- |
| 71 | Sequence Detector 1011     | `71_sequence_detector_1011.v`   | Moore/Mealy detector for detecting `1011`         |
| 72 | Sequence Detector 1101     | `72_sequence_detector_1101.v`   | Sequence detector for detecting `1101`            |
| 73 | Traffic Light Controller   | `73_traffic_light_controller.v` | 3-state traffic controller (Red → Green → Yellow) |
| 74 | Vending Machine FSM        | `74_vending_machine.v`          | Accepts ₹5/₹10 coins & dispenses product          |
| 75 | Lift (Elevator) Controller | `75_lift_controller.v`          | FSM-based floor movement controller               |
| 76 | Washing Machine Controller | `76_washing_machine.v`          | Fill → Wash → Spin → Done sequence                |
| 77 | Stopwatch Controller       | `77_stopwatch_controller.v`     | Start/Stop/Clear FSM with 16-bit counter          |
| 78 | Password Door Lock FSM     | `78_password_door_lock.v`       | 4-bit password detection FSM                      |
| 79 | UART Transmitter (TX)      | `79_uart_tx.v`                  | Serial transmitter with start/stop bits           |
| 80 | UART Receiver (RX)         | `80_uart_rx.v`                  | UART receiver with sampling FSM                   |

🧪 Unified Testbench

File: testbench.v

✔ Testbench Validates:
🔹 Sequence Detectors

1011 detection

1101 detection

Random bit-stream applied

Correct dout assertion

🔹 Controllers

Traffic Light → full cycle validation

Vending Machine → ₹5 + ₹10 → dispense check

Lift → Up & Down requests

Washing Machine → Fill → Wash → Spin → Done

🔹 Stopwatch

Start → Stop → Clear behavior

🔹 Password Lock

Full password entry sequence

Unlock logic verification

🔹 UART

TX → start bit, data bits, stop bit

RX → serial data sampling

rx_ready + received byte checking

✔ Testbench Features

Clock generator

Active-low reset

Stimulus blocks for each FSM

$display for readable output

Clean structured simulation flow

Supports VCD dump (dump.vcd)

▶️ Run Simulation (Icarus Verilog)

Compile

iverilog -o fsm_designs.out *.v

Run

vvp fsm_designs.out

Open Waveform

gtkwave dump.vcd

📂 Folder Structure

08_fsm_designs/
│
├── 71_sequence_detector_1011.v
├── 72_sequence_detector_1101.v
├── 73_traffic_light_controller.v
├── 74_vending_machine.v
├── 75_lift_controller.v
├── 76_washing_machine.v
├── 77_stopwatch_controller.v
├── 78_password_door_lock.v
├── 79_uart_tx.v
├── 80_uart_rx.v
│
├── testbench.v
└── README.md

🧪 Expected Simulation Output

=== Starting FSM Testbench ===

-- Sequence Detectors --
1011 Detector OK
1101 Detector OK

-- Controllers --
Traffic Light sequence OK
Vending Machine dispense OK
Lift up/down logic OK
Washing Machine cycle OK

-- Stopwatch --
Start/Stop/Clear OK

-- Password Lock --
Unlock sequence OK

-- UART --
TX transmission OK
RX reception OK

=== All FSM Tests Completed Successfully ===

📈 Learning Outcomes

✔ Learn how FSMs are designed (Mealy/Moore)
✔ Build real-world controllers (lift, washing machine, vending machine)
✔ Understand UART protocol implementation
✔ Master sequence detection logic
✔ Gain confidence in writing unified reusable testbenches
✔ Improve debugging using waveforms

---