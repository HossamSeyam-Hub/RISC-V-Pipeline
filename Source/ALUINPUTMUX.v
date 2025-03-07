`timescale 1ns / 1ps

module ALUINPUTMUX(
    input wire [31 : 0] reg_data,
    input wire [31 : 0] ImmExx ,
    input wire alu_src ,
    output wire [31:0] SrcB   
);
assign SrcB = (alu_src) ? ImmExx : reg_data ;
endmodule
