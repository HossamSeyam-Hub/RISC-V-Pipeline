`timescale 1ns / 1ps

module Execute_Memory_Register(ALUResult_E, WriteData_E, Rd_E, pcplus4_E, RegWrite_E, ResultSrc_E, MemWrite_E, 
                               ALUResult_M, WriteData_M, Rd_M, pcplus4_M, RegWrite_M, ResultSrc_M, MemWrite_M, 
                               clk );

    input [31:0] ALUResult_E , WriteData_E, pcplus4_E ;
    input [4:0] Rd_E;
    input [1:0] ResultSrc_E;
    input MemWrite_E, RegWrite_E;
    input clk;

    output reg [31:0] ALUResult_M, WriteData_M, pcplus4_M;
    output reg [4:0] Rd_M;
    output reg [1:0] ResultSrc_M;
    output reg MemWrite_M, RegWrite_M;
    
     always @(posedge clk)
      begin
           ALUResult_M  <= ALUResult_E ;
           WriteData_M  <= WriteData_E;
           Rd_M         <= Rd_E;
           pcplus4_M    <= pcplus4_E ;
           RegWrite_M   <= RegWrite_E;
           ResultSrc_M  <= ResultSrc_E;
           MemWrite_M   <= MemWrite_E;          
       end
endmodule
