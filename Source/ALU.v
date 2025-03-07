`timescale 1ns / 1ps

module ALU (SrcA, SrcB, ALUControl, ALUResult, Zero);
    input signed [31:0] SrcA;        // First operand
    input signed [31:0] SrcB;        // Second operand
    input [2:0] ALUControl;          // (from ALU Decoder)
    output reg signed [31:0] ALUResult; 
    output reg Zero;                 // Zero flag: 1 if ALUResult is zero
    
    always @(*) begin
        // Default values t
        Zero = 0;
        
        case (ALUControl)
            3'b000:  // ADD
            begin 
                ALUResult = SrcA + SrcB;
            end

            3'b001:  // SUB
            begin
                ALUResult = SrcA - SrcB;
                Zero = (ALUResult == 32'b0); // if Zero = 1 >> beq , else >> bne
            end

            3'b010:  // AND
            begin
                ALUResult = SrcA & SrcB;
            end

            3'b011:  // OR
            begin
                ALUResult = SrcA | SrcB;
            end

            3'b100:  // XOR
            begin
                ALUResult = SrcA ^ SrcB;
            end

            3'b101:  // SLT (Set Less Than)
            begin
                ALUResult = (SrcA < SrcB) ? 1 : 0;
            end

            3'b110:  // Shift Left Logical (SLL)
            begin
                ALUResult = SrcA << SrcB; 
            end

            3'b111:  // Shift Right Logical (SRL)
            begin
                ALUResult = SrcA >> SrcB; 
            end

            default: 
            begin
                ALUResult = 32'bx;   // Unknown operation
            end
        endcase
    end
endmodule
