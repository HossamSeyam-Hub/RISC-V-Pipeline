`timescale 1ns / 1ps

module Decode_Execute_Register(RD1_D, RD2_D, pc_D, Rs1_D, Rs2_D, Rd_D, ImmExt_D, pcplus4_D, RegWrite_D, ResultSrc_D, MemWrite_D, Jump_D, Branch_D, ALUControl_D, ALUSrc_D,Funct3_lsb_D,
                               RD1_E, RD2_E, pc_E, Rs1_E, Rs2_E, Rd_E, ImmExt_E, pcplus4_E, RegWrite_E, ResultSrc_E, MemWrite_E, Jump_E, Branch_E, ALUControl_E, ALUSrc_E,Funct3_lsb_E, 
                               clk, Flush_E );
                               
                               
    input [31:0] RD1_D, RD2_D, pc_D, ImmExt_D, pcplus4_D;
    input [4:0]  Rs1_D, Rs2_D, Rd_D;
    input [2:0]  ALUControl_D;
    input [1:0]  ResultSrc_D;
    input RegWrite_D, MemWrite_D, Jump_D, Branch_D, ALUSrc_D, Funct3_lsb_D;
    input clk, Flush_E;
    
    output reg [31:0] RD1_E, RD2_E, pc_E, ImmExt_E, pcplus4_E;
    output reg [4:0]  Rs1_E, Rs2_E, Rd_E ;
    output reg [2:0]  ALUControl_E;
    output reg [1:0]  ResultSrc_E; 
    output reg RegWrite_E, MemWrite_E, Jump_E, Branch_E, ALUSrc_E, Funct3_lsb_E;
    
    // triggering on the clock rising edge 
    always @(posedge clk) 
    begin
        if (Flush_E) 
        begin
            RD1_E         <= 32'b0;
            RD2_E         <= 32'b0;
            pc_E          <= 32'b0;
            Rs1_E         <= 5'b0;
            Rs2_E         <= 5'b0;
            Rd_E          <= 5'b0;
            ImmExt_E      <= 32'b0;
            pcplus4_E     <= 32'b0;  
            RegWrite_E    <= 1'b0;
            ResultSrc_E   <= 2'b0;
            MemWrite_E    <= 1'b0;
            Jump_E        <= 1'b0;
            Branch_E      <= 1'b0;
            ALUControl_E  <= 3'b0;
            ALUSrc_E      <= 1'b0;    
            Funct3_lsb_E  <= 1'b0;
        end 
        else 
        begin
            RD1_E         <= RD1_D;
            RD2_E         <= RD2_D;
            pc_E          <= pc_D;
            Rs1_E         <= Rs1_D;
            Rs2_E         <= Rs2_D;
            Rd_E          <= Rd_D;
            ImmExt_E      <= ImmExt_D;
            pcplus4_E     <= pcplus4_D;  
            RegWrite_E    <= RegWrite_D;
            ResultSrc_E   <= ResultSrc_D;
            MemWrite_E    <= MemWrite_D;
            Jump_E        <= Jump_D;
            Branch_E      <= Branch_D;
            ALUControl_E  <= ALUControl_D;
            ALUSrc_E      <= ALUSrc_D;   
            Funct3_lsb_E  <= Funct3_lsb_D; 
        end
    end
endmodule
