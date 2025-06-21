
# mini_core – Simple Verilog ALU Core

This project implements a minimal 8-bit processor core in Verilog. It includes:
- A 4-register register file
- A simple 4-operation ALU (add, sub, and, or)
- Memory interface with 16 bytes of RAM

---

## 🧠 Features

- 8-bit wide registers and memory
- ALU supports: 
  - 00: Addition
  - 01: Subtraction
  - 10: AND
  - 11: OR
- Internal signal-controlled operation flow
- Waveform simulation with Icarus Verilog + GTKWave

---

## 🧪 How to Simulate

1. **Install dependencies (Linux):**
   ```bash
   sudo apt install iverilog gtkwave
   ```

2. **Run simulation:**
   ```bash
   iverilog -o sim.out src/mini_core.v tb/mini_core_tb.v
   vvp sim.out
   ```

3. **View waveform:**
   ```bash
   gtkwave mini_core.vcd
   ```

---

## 📁 Project Structure

```
mini_core/
├── src/
│   └── mini_core.v
├── tb/
│   └── mini_core_tb.v
├── mini_core.vcd         # Generated after sim
├── run.sh                # Optional script to simulate
└── README.md
```

---

## ✅ TODO / Improvements

- Add external control interface for ALU inputs
- Add instruction decoder and program memory
- Add testcases for each operation
