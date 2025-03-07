# RISC-V-Pipeline

This repository contains an implementation of a pipelined RISC-V processor, designed to execute a subset of the RV32I instruction set efficiently. The processor follows a five-stage pipeline architecture to improve instruction throughput while handling data and control hazards.

🛑Features

  ✳Implements a 5-stage pipeline:
  
  ✅Fetch (IF) – Instruction fetching from memory
  
 ![1-Fetch_Stage](https://github.com/user-attachments/assets/93f0baa1-0397-452e-adca-856a9f14c6c2)

  ✅Decode (ID) – Instruction decoding and register read
  
   ![2-Decpode_Stage](https://github.com/user-attachments/assets/4e1854b6-2c89-43d1-8661-c98cf5f27299)

  ✅Execute (EX) – ALU operations and branch calculations
  
  ![3-Execute_stage](https://github.com/user-attachments/assets/4d8ce3f1-2380-4ecc-a0be-72fad04fd609)

  ✅Memory (MEM) – Data memory access
  
  ![4-Memory_Stage](https://github.com/user-attachments/assets/4040bb8c-eeb3-431d-984c-1a9fb36adc3a)

  ✅Write-back (WB) – Writing results back to registers
  
  ![Screenshot 2025-02-25 161737 - Copy](https://github.com/user-attachments/assets/aad1f056-cfba-4b41-8381-da53e460d94a)

  ✳Supports a subset of the RV32I instruction set
  
  ![WhatsApp Image 2024-12-06 at 15 29 08_532705af - Copy](https://github.com/user-attachments/assets/43dccb5d-e8aa-4dba-a42d-1e3ac6d53ea0)


  ✳Implements hazard detection and forwarding to resolve data dependencies

  ✳Designed in Verilog

  ✳Testbenches and example programs included

🚀 Feel free to contribute, report issues, or suggest improvements!

![Screenshot 2025-02-25 161737](https://github.com/user-attachments/assets/08d66922-9b00-4f58-9a2f-ef6e7e3d8a52)
