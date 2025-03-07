`timescale 1ns / 1ps

module RISCV_PP(input clk, reset);

    // Wires between stages
    wire [31:0] pcF, instrD, pcD, pcPlus4D;
    wire [31:0] rd1D, rd2D, immExtD;
    wire [31:0] aluResultE, writeDataE;
    wire [31:0] readDataM, aluResultM;
    wire [31:0] resultW;

    // Control Signals
    wire regWriteD, memWriteD, jumpD, branchD;
    wire regWriteE, memWriteE, jumpE, branchE;
    wire regWriteM, memWriteM;
    wire regWriteW;

    // Fetch Stage
    Fetch_Stage fetch_stage (
        .clk(clk),
        .rst(reset),
        .pcF(pcF)
    );
    
    // Fetch-Decode Register
    Fetch_Decode_Register fetch_decode_reg (
        .clk(clk),
        .instrF(pcF),
        .instrD(instrD),
        .pcF(pcF),
        .pcD(pcD)
    );
    
    // Decode Stage
    Decode_stage decode_stage (
        .clk(clk),
        .instrD(instrD),
        .rd1D(rd1D),
        .rd2D(rd2D),
        .immExtD(immExtD),
        .regWriteD(regWriteD),
        .memWriteD(memWriteD),
        .jumpD(jumpD),
        .branchD(branchD)
    );
    
    // Decode-Execute Register
    Decode_Execute_Register decode_execute_reg (
        .clk(clk),
        .rd1D(rd1D),
        .rd2D(rd2D),
        .immExtD(immExtD),
        .rd1E(rd1D),
        .rd2E(rd2D),
        .immExtE(immExtD)
    );
    
    // Execute Stage
    Execute_Stage execute_stage (
        .clk(clk),
        .rd1E(rd1D),
        .rd2E(rd2D),
        .aluResultE(aluResultE),
        .writeDataE(writeDataE)
    );
    
    // Execute-Memory Register
    Execute_Memory_Register execute_memory_reg (
        .clk(clk),
        .aluResultE(aluResultE),
        .writeDataE(writeDataE),
        .aluResultM(aluResultM),
        .writeDataM(writeDataE)
    );
    
    // Memory Stage
    MEMORY_STAGE memory_stage (
        .clk(clk),
        .aluResultM(aluResultM),
        .readDataM(readDataM)
    );
    
    // Memory-Writeback Register
    Memory_Writeback_Register memory_writeback_reg (
        .clk(clk),
        .readDataM(readDataM),
        .aluResultM(aluResultM),
        .resultW(resultW)
    );
    
    // Writeback Stage
    WriteBack_Stage writeback_stage (
        .clk(clk),
        .resultW(resultW)
    );
    
    // Hazard Unit
    Hazard_Unit hazard_unit (
        .clk(clk),
        .stallF(),
        .stallD()
    );
    
endmodule

