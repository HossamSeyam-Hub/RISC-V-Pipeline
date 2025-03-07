`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ahmed Magdy fathy 
// Module Name: Instruction_memory
// Project Name:Risc_v processor  
// Tool Versions: 
// Description: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Instruction_memory(
        input  [31:0] A,
        output [31:0] RD
    );
  // modeling an instruction memory with  32 bit width and 64 element depth 
  
    reg [31:0] mem [63:0]; 
    
 /* initialize the instruction memory with some instructions  
  of the program supposed to be executed on our processor from external file  */
  
    initial 
    begin
    $readmemh("D:\\Collage\\Fourth\\Graduation_Project_RISC-V\\5-Second_Term_Enhanced_RISC-V_Core\\1-Pipeline\\RISCV_Pipeline_Code\\New\\Pure Codes\\inst_mem_2.txt", mem);
    end 
    
   /* reads the 32-bit data (i.e., instruction) 
    from that address onto the read dataoutput, RD.*/
    
    assign RD = mem [A[31:2]];
    
endmodule