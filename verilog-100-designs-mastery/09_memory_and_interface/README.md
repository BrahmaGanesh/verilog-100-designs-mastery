# 🚀 09 - Memory & Interface Modules (Verilog/SystemVerilog)

This folder contains **essential memory, FIFO, stack, UART, SPI, and I2C designs** implemented in Verilog/SystemVerilog, along with a **unified testbench**.

This is Part-9 of the **100 Verilog Designs Mastery Series**.

---

## 📘 Included Modules

| No | Design Name       | File                | Description                                                      |
| -- | ----------------- | ------------------- | ---------------------------------------------------------------- |
| 81 | Single-Port RAM   | `single_port_ram.v` | 4-bit addressable RAM with synchronous write and read            |
| 82 | Dual-Port RAM     | `dual_port_ram.v`   | Two independent ports for read/write operations                  |
| 83 | ROM (Case-Based)  | `rom_case.v`        | 4-bit addressable read-only memory                               |
| 84 | Synchronous FIFO  | `fifo_sync.v`       | FIFO with single clock for write & read, full/empty flags        |
| 85 | Asynchronous FIFO | `async_fifo.v`      | FIFO with separate write/read clocks                             |
| 86 | Stack Memory      | `stack_memory.v`    | Push/Pop memory with full/empty detection                        |
| 87 | UART Transmitter  | `uart_tx.v`         | Serial data transmission with busy flag                          |
| 88 | UART Receiver     | `uart_rx.v`         | Serial data reception with ready flag                            |
| 89 | SPI Master        | `spi_master.v`      | SPI master with MOSI, MISO, SCLK, CS control                     |
| 90 | I2C Master        | `i2c_master.v`      | I2C master supporting start, read/write, and slave communication |

---

## 🧪 Unified Testbench

**File:** `testbench.v`

### ✔ Testbench Validates:

### 🔹 Memory Modules

* Single-Port RAM → Write & Read functionality
* Dual-Port RAM → Independent port operations
* ROM → Addressable read verification

### 🔹 FIFO / Stack

* Synchronous FIFO → Write/Read with full/empty flags
* Asynchronous FIFO → Write/Read with separate clocks
* Stack Memory → Push/Pop operations

### 🔹 UART / SPI / I2C

* UART TX → Data transmission
* UART RX → Data reception
* SPI Master → MOSI/MISO loopback
* I2C Master → Write to slave simulation

### ✔ Testbench Features

* Clock generator for multiple clocks
* Active-low reset
* Sequential stimulus for all modules
* `$display` statements for status
* Loopback for SPI and UART
* Tri-state modeling for I2C SDA
* Generates `waveform.vcd`

---

## ▶️ Run Simulation (Icarus Verilog)

### **Compile**

```sh
iverilog -o memory_interface_tb.out *.v *.sv
```

### **Run**

```sh
vvp memory_interface_tb.out
```

### **Open Waveform**

```sh
gtkwave waveform.vcd
```

---

📂 **Folder Structure**

```
09_memory_interface/
│
├── single_port_ram.v
├── dual_port_ram.v
├── rom_case.v
├── fifo_sync.v
├── async_fifo.v
├── stack_memory.v
├── uart_tx.v
├── uart_rx.v
├── spi_master.v
├── i2c_master.v
│
├── testbench.v
└── README.md
```

---

🧪 **Expected Simulation Output**

```
=== Starting Memory & Interface Testbench ===

-- Memory Modules --
Single-Port RAM : Write/Read OK
Dual-Port RAM : Independent Port Operation OK
ROM : Read OK

-- FIFO / Stack --
Synchronous FIFO : Write/Read OK
Asynchronous FIFO : Write/Read with clocks OK
Stack : Push/Pop OK

-- UART / SPI / I2C --
UART TX : Transmission OK
UART RX : Reception OK
SPI : MOSI/MISO Loopback OK
I2C : Slave Write OK

=== All tests completed successfully ===
```

---

📈 **Learning Outcomes**

✔ Understand RAM, ROM and dual-port memory designs
✔ Master synchronous and asynchronous FIFOs
✔ Learn stack memory design and control
✔ Implement UART, SPI, and I2C communication
✔ Build a reusable unified testbench
✔ Debug and verify using waveform analysis

---

