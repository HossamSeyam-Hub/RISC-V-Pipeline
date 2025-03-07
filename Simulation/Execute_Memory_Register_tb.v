`timescale 1ns / 1ps

module Execute_Memory_Register_tb();

    // 1) Declare local reg and wire identifiers with _tb suffix
    reg [31:0] ALUResult_E, WriteData_E, pcplus4_E;
    reg [4:0] Rd_E;
    reg [1:0] ResultSrc_E;
    reg MemWrite_E, RegWrite_E;
    reg clk;

    wire [31:0] ALUResult_M, WriteData_M, pcplus4_M;
    wire [4:0] Rd_M;
    wire [1:0] ResultSrc_M;
    wire MemWrite_M, RegWrite_M;

    // 2) Instantiate the Fetch_Decode_Register module under test
    Execute_Memory_Register UUT (
        .clk(clk),
        .ALUResult_E(ALUResult_E),
        .WriteData_E(WriteData_E),
        .pcplus4_E(pcplus4_E),
        .Rd_E(Rd_E),
        .ResultSrc_E(ResultSrc_E),
        .MemWrite_E(MemWrite_E),
        .RegWrite_E(RegWrite_E),
        .ALUResult_M(ALUResult_M),
        .WriteData_M(WriteData_M),
        .pcplus4_M(pcplus4_M),
        .Rd_M(Rd_M),
        .ResultSrc_M(ResultSrc_M),
        .MemWrite_M(MemWrite_M),
        .RegWrite_M(RegWrite_M)
    );
    // 3) Clock generation
        initial 
        begin
            clk = 0;  
        end
        
        always
        begin
            clk = ~clk; #5;  
        end
        
        // 4) Generate stimuli using initial and always
        initial 
        begin
            // Initialize  
            ALUResult_E = 32'b111; WriteData_E = 32'b11; Rd_E = 5'b11111; pcplus4_E = 32'b1100; RegWrite_E = 1'b0; ResultSrc_E = 2'b00; MemWrite_E = 1'b1; #7;
            ALUResult_E = 32'b011; WriteData_E = 32'b10; Rd_E = 5'b10101; pcplus4_E = 32'b0101; RegWrite_E = 1'b1; ResultSrc_E = 2'b10; MemWrite_E = 1'b1; #7;
            ALUResult_E = 32'b101; WriteData_E = 32'b01; Rd_E = 5'b01010; pcplus4_E = 32'b0010; RegWrite_E = 1'b1; ResultSrc_E = 2'b01; MemWrite_E = 1'b1; #7;
            ALUResult_E = 32'b100; WriteData_E = 32'b00; Rd_E = 5'b01100; pcplus4_E = 32'b1001; RegWrite_E = 1'b0; ResultSrc_E = 2'b11; MemWrite_E = 1'b0; #7;
            
            // End simulation
            #40 $stop;
        end
    

endmodule
