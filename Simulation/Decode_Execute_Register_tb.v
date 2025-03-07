`timescale 1ns / 1ps

module Decode_Execute_Register_tb();

    // 1) Declare local reg and wire identifiers with _tb suffix
    reg [31:0] RD1_D, RD2_D, pc_D, ImmExt_D, pcplus4_D;
    reg [4:0]  Rs1_D, Rs2_D, Rd_D;
    reg [2:0]  ALUControl_D;
    reg [1:0]  ResultSrc_D;
    reg RegWrite_D, MemWrite_D, Jump_D, Branch_D, ALUSrc_D, Funct3_lsb_D;
    reg clk, CLR;

    wire [31:0] RD1_E, RD2_E, pc_E, ImmExt_E, pcplus4_E;
    wire [4:0]  Rs1_E, Rs2_E, Rd_E;
    wire [2:0]  ALUControl_E;
    wire [1:0]  ResultSrc_E;
    wire RegWrite_E, MemWrite_E, Jump_E, Branch_E, ALUSrc_E, Funct3_lsb_E;
    
    // 2) Instantiate the Fetch_Decode_Register module under test
    Decode_Execute_Register UUT (
        .RD1_D(RD1_D), .RD2_D(RD2_D), .pc_D(pc_D), .Rs1_D(Rs1_D), .Rs2_D(Rs2_D), .Rd_D(Rd_D), 
        .ImmExt_D(ImmExt_D), .pcplus4_D(pcplus4_D), .RegWrite_D(RegWrite_D), .ResultSrc_D(ResultSrc_D), 
        .MemWrite_D(MemWrite_D), .Jump_D(Jump_D), .Branch_D(Branch_D), .ALUControl_D(ALUControl_D), 
        .ALUSrc_D(ALUSrc_D),.Funct3_lsb_D(Funct3_lsb_D),.RD1_E(RD1_E), .RD2_E(RD2_E), .pc_E(pc_E), .Rs1_E(Rs1_E), .Rs2_E(Rs2_E), 
        .Rd_E(Rd_E), .ImmExt_E(ImmExt_E), .pcplus4_E(pcplus4_E), .RegWrite_E(RegWrite_E), 
        .ResultSrc_E(ResultSrc_E), .MemWrite_E(MemWrite_E), .Jump_E(Jump_E), .Branch_E(Branch_E), 
        .ALUControl_E(ALUControl_E), .ALUSrc_E(ALUSrc_E),.Funct3_lsb_E(Funct3_lsb_E), .clk(clk), .Flush_E(CLR)
    );

   // 3) Clock generation
    initial 
    begin
        clk = 1;  
    end
    
    always
    begin
        clk = ~clk; #5;  
    end
    
    // 4) Generate stimuli using initial and always
    initial 
    begin
        // Initialize  
        RD1_D = 32'b010; RD2_D = 32'b111; pc_D = 32'b1111; Rs1_D = 5'b110; Rs2_D = 5'b001; Rd_D = 5'b100; ImmExt_D = 32'b1111; pcplus4_D = 32'b10; RegWrite_D = 1'b1; ResultSrc_D = 2'b01; MemWrite_D = 1'b1; Jump_D = 1'b0; Branch_D = 1'b0; ALUControl_D = 3'b111; ALUSrc_D = 1'b1; Funct3_lsb_D = 1'b0; CLR = 1'b0; #10;
        RD1_D = 32'b011; RD2_D = 32'b101; pc_D = 32'b1010; Rs1_D = 5'b101; Rs2_D = 5'b100; Rd_D = 5'b010; ImmExt_D = 32'b1001; pcplus4_D = 32'b11; RegWrite_D = 1'b0; ResultSrc_D = 2'b11; MemWrite_D = 1'b0; Jump_D = 1'b1; Branch_D = 1'b0; ALUControl_D = 3'b100; ALUSrc_D = 1'b0; Funct3_lsb_D = 1'b1;CLR = 1'b0; #10;
        RD1_D = 32'b100; RD2_D = 32'b110; pc_D = 32'b1100; Rs1_D = 5'b011; Rs2_D = 5'b111; Rd_D = 5'b101; ImmExt_D = 32'b1110; pcplus4_D = 32'b01; RegWrite_D = 1'b1; ResultSrc_D = 2'b00; MemWrite_D = 1'b0; Jump_D = 1'b1; Branch_D = 1'b0; ALUControl_D = 3'b101; ALUSrc_D = 1'b1; Funct3_lsb_D = 1'b0;CLR = 1'b0; #10;
        RD1_D = 32'b101; RD2_D = 32'b100; pc_D = 32'b1001; Rs1_D = 5'b010; Rs2_D = 5'b101; Rd_D = 5'b110; ImmExt_D = 32'b1010; pcplus4_D = 32'b00; RegWrite_D = 1'b0; ResultSrc_D = 2'b10; MemWrite_D = 1'b1; Jump_D = 1'b0; Branch_D = 1'b1; ALUControl_D = 3'b001; ALUSrc_D = 1'b0; Funct3_lsb_D = 1'b1;CLR = 1'b1; #10;
        
        // End simulation
        #40 $stop;
    end
endmodule
