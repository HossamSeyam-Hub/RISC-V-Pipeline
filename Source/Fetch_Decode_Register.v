`timescale 1ns / 1ps

module Fetch_Decode_Register(Instr_F, pc_F, pcplus4_F,
                             Instr_D, pc_D, pcplus4_D,
                             clk, Flush_D, Stall_D);

    input [31:0] Instr_F, pc_F, pcplus4_F;                    
    input clk, Flush_D, Stall_D;                                                 
    output reg [31:0] Instr_D, pc_D, pcplus4_D;   
    
    always @(posedge clk) 
    begin
        if (Flush_D)
        begin
            Instr_D <= 32'b0;
            pc_D <= 32'b0;
            pcplus4_D <= 32'b0;
        end 
        else if (!Stall_D) 
        begin
            Instr_D <= Instr_F;
            pc_D <= pc_F;
            pcplus4_D <= pcplus4_F;
        end
    end

endmodule


