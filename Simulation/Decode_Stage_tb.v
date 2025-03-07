`timescale 1ns / 1ps

module Decode_Stage_tb();
    // Testbench signals
    reg clk;
    reg Regwrite_W;
    reg [4:0] Rd_W;
    reg [31:0] Instr_D, PC_D_in, PCPlus4_D_in, Result_W;
    
    wire RegWrite_D, MemWrite_D, Jump_D, Branch_D, ALUSrc_D, Funct3_lsb_D;
    wire [1:0] ResultSrc_D;
    wire [2:0] ALUControl_D;
    wire [4:0] Rs1_D, Rs2_D, Rd_D;
    wire [31:0] RD1_D, RD2_D, PC_D_out, ImmExt_D, PCPlus4_D_out;
    
    // Instantiate the module under test
    Decode_stage DUT (
        .Instr_D(Instr_D),
        .PC_D_in(PC_D_in),
        .PCPlus4_D_in(PCPlus4_D_in),
        .Rd_W(Rd_W),
        .Result_W(Result_W),
        .Regwrite_W(Regwrite_W),
        .RegWrite_D(RegWrite_D),
        .ResultSrc_D(ResultSrc_D),
        .MemWrite_D(MemWrite_D),
        .Jump_D(Jump_D),
        .Branch_D(Branch_D),
        .ALUControl_D(ALUControl_D),
        .ALUSrc_D(ALUSrc_D),
        .Funct3_lsb_D(Funct3_lsb_D),
        .RD1_D(RD1_D),
        .RD2_D(RD2_D),
        .PC_D_out(PC_D_out),
        .ImmExt_D(ImmExt_D),
        .PCPlus4_D_out(PCPlus4_D_out),
        .Rs1_D(Rs1_D),
        .Rs2_D(Rs2_D),
        .Rd_D(Rd_D),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        Regwrite_W = 1'b0; Rd_W = 5'b00001; Instr_D = 32'h00500113; PC_D_in = 32'h0000000A; PCPlus4_D_in = 32'h0000000E; Result_W = 32'hA; #10;
        Regwrite_W = 1'b0; Rd_W = 5'b00010; Instr_D = 32'h00C00193; PC_D_in = 32'h0000000A; PCPlus4_D_in = 32'h0000000E; Result_W = 32'hA; #10;
        Regwrite_W = 1'b0; Rd_W = 5'b00011; Instr_D = 32'hFF718393; PC_D_in = 32'h0000000A; PCPlus4_D_in = 32'h0000000E; Result_W = 32'hA; #10;
        Regwrite_W = 1'b1; Rd_W = 5'b00100; Instr_D = 32'h0023E233; PC_D_in = 32'h0000000A; PCPlus4_D_in = 32'h0000000E; Result_W = 32'hA; #10; 
        
        $finish;
    end
endmodule