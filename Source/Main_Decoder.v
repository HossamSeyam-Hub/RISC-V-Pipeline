`timescale 1ns / 1ps

module Main_Decoder(Op, Jump, Branch, MemWrite, RegWrite, AluSrc, ImmSrc, ResultSrc, AluOp);
       input  wire [6:0] Op;
       output wire Jump,Branch,MemWrite,RegWrite,AluSrc;
       output wire [1:0]ImmSrc,ResultSrc,AluOp;
    
    
    reg [10:0] controls;
    assign {RegWrite,ImmSrc,AluSrc,MemWrite,ResultSrc,Branch,AluOp,Jump} = controls;
    
    always @(*) 
    begin
        case (Op)
          7'b0000011: controls = 11'b10010010000;    // Load (lw)
          7'b0100011: controls = 11'b00111xx0000;    // Store (sw)
          7'b0110011: controls = 11'b1xx00000100;    // R-type (add/sub/sll/srl/and/or/xor)
          7'b1100011: controls = 11'b01000xx1010;    // Branch (beq/bne)
          7'b0010011: controls = 11'b10010000100;    // I-type (addi/slli/srli/andi/ori/xori)
          7'b1101111: controls = 11'b111x0100xx1;    // Jump (jal)
          default:    controls = 11'b00000000000;    // Default (invalid)
        endcase
    end 
endmodule
