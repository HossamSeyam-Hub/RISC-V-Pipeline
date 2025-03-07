`timescale 1ns / 1ps

module Memory_Writeback_Register_tb();

    // 1) Declare local reg and wire identifiers with _tb suffix
    reg [31:0] ALUResult_M, RD_M, pcplus4_M;
    reg [4:0] Rd_M;
    reg [1:0] ResultSrc_M;
    reg RegWrite_M;
    reg clk;
    
    wire [31:0] ALUResult_W, RD_W, pcplus4_W;
    wire [4:0] Rd_W;
    wire [1:0] ResultSrc_W;
    wire RegWrite_W;

    // 2) Instantiate the Fetch_Decode_Register module under test
    Memory_Writeback_Register UUT (
        .clk(clk),
        .ALUResult_M(ALUResult_M),
        .RD_M(RD_M),
        .pcplus4_M(pcplus4_M),
        .Rd_M(Rd_M),
        .ResultSrc_M(ResultSrc_M),
        .RegWrite_M(RegWrite_M),
        .ALUResult_W(ALUResult_W),
        .RD_W(RD_W),
        .pcplus4_W(pcplus4_W),
        .Rd_W(Rd_W),
        .ResultSrc_W(ResultSrc_W),
        .RegWrite_W(RegWrite_W)
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
            ALUResult_M = 32'b111;  RD_M = 32'b101; Rd_M = 5'b0001;  pcplus4_M = 32'b111; ResultSrc_M = 2'b00; RegWrite_M = 1'b0; #7;
            ALUResult_M = 32'b110;  RD_M = 32'b111; Rd_M = 5'b0101;  pcplus4_M = 32'b110; ResultSrc_M = 2'b10; RegWrite_M = 1'b1; #7;
            ALUResult_M = 32'b101;  RD_M = 32'b010; Rd_M = 5'b0001;  pcplus4_M = 32'b101; ResultSrc_M = 2'b01; RegWrite_M = 1'b1; #7;
            ALUResult_M = 32'b100;  RD_M = 32'b100; Rd_M = 5'b0110;  pcplus4_M = 32'b011; ResultSrc_M = 2'b11; RegWrite_M = 1'b0; #7;
            
           // End simulation
           #30 $stop;
       end
endmodule
