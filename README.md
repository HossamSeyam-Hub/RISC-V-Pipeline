# RISC-V-Pipeline

This repository contains an implementation of a pipelined RISC-V processor, designed to execute a subset of the RV32I instruction set efficiently. The processor follows a five-stage pipeline architecture to improve instruction throughput while handling data and control hazards.

Features

  ✳Implements a 5-stage pipeline:
  
    ✅Fetch (IF) – Instruction fetching from memory

    ✅Decode (ID) – Instruction decoding and register read

    ✅Execute (EX) – ALU operations and branch calculations

    ✅Memory (MEM) – Data memory access

    ✅Write-back (WB) – Writing results back to registers

  ✳Supports a subset of the RV32I instruction set

  ✳Implements hazard detection and forwarding to resolve data dependencies

  ✳Designed in Verilog

  ✳Testbenches and example programs included

🚀 Feel free to contribute, report issues, or suggest improvements!

![Screenshot 2025-02-25 161737](https://github.com/user-attachments/assets/08d66922-9b00-4f58-9a2f-ef6e7e3d8a52)
