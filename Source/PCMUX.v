`timescale 1ns / 1ps

module PCMUX(
    input wire [31:0] pc_plus4,
    input wire [31:0] PCTarget,
    input wire pcsrc,
    output reg [31:0] pc_next
);

always @(*) begin
    case (pcsrc)
        1'b1: pc_next = PCTarget;
        default: pc_next = pc_plus4; 
    endcase
end

endmodule