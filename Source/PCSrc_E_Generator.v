`timescale 1ns / 1ps

module PCSrc_E_Generator(
    input wire Zero_E, Jump_E, Branch_E, Funct3_lsb_E,
    output wire PCSrc_E
);

    wire PCSrc_internal;
    
    assign PCSrc_internal = Jump_E | ((Zero_E ^ Funct3_lsb_E) & Branch_E);
    
//    assign PCSrc_E = rst ? 1'b0 : PCSrc_internal;
    assign PCSrc_E = (PCSrc_internal !== 1'b0 && PCSrc_internal !== 1'b1) ? 1'b0 : PCSrc_internal;

endmodule
