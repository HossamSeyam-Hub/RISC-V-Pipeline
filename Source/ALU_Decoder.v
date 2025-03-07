`timescale 1ns / 1ps

module ALU_Decoder (opb5, funct3, funct7b5, ALUOp, ALUControl);
    input wire opb5;              
    input wire [2:0] funct3;      
    input wire funct7b5;          
    input wire [1:0] ALUOp;       
    output reg [2:0] ALUControl;   // ALU control signals


    wire RtypeSub;                
    assign RtypeSub = funct7b5 & opb5; // If TRUE (R-type subtract)

    always @(*) begin
        case (ALUOp)
            2'b00: 
                ALUControl = 3'b000; // Addition (for lw/sw)
            2'b01: 
                ALUControl = 3'b001; // Subtraction (for branch equal / branch not equal)
            2'b10: 
            begin
                case (funct3)        // R-type or I-type operations
                    3'b000: 
                        ALUControl = (RtypeSub) ? 3'b001 : 3'b000; // Sub or Add/Addi
                    3'b001: 
                        ALUControl = 3'b110;    // sll/slli                 
                    3'b010: 
                        ALUControl = 3'b101;    // slt/slti
                    3'b100: 
                        ALUControl = 3'b100;    // xor/xori      
                    3'b101: 
                        ALUControl = 3'b111;    // srl/srli                 
                    3'b110: 
                        ALUControl = 3'b011;    // or/ori
                    3'b111: 
                        ALUControl = 3'b010;    // and/andi

                    default: 
                        ALUControl = 3'bxxx;     // Undefined operation
                endcase
            end
           default: 
                ALUControl = 3'bxxx;  
        endcase
    end
endmodule
