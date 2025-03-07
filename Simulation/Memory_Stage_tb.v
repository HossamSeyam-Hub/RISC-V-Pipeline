`timescale 1ns / 1ps

module Memory_Stage_tb();

     reg MemWriteM, RegWriteM_in, clk;
     reg [1:0] ResultSrcM_in;
     reg [4:0] RdM_in;
     reg [31:0] ALUResultM_in, WriteDataM, PCPlus4M_in;

    //output ports
     wire RegWriteM_out;
     wire [1:0] ResultSrcM_out;
     wire [4:0] RdM_out;
     wire [31:0] ALUResultM_out, ReadDataM, PCPlus4M_out;
     
     MEMORY_STAGE MS(
            .RegWriteM_in(RegWriteM_in), 
            .ResultSrcM_in(ResultSrcM_in), 
            .MemWriteM(MemWriteM), 
            .ALUResultM_in(ALUResultM_in), 
            .WriteDataM(WriteDataM), 
            .RdM_in(RdM_in), 
            .PCPlus4M_in(PCPlus4M_in), 
            .RegWriteM_out(RegWriteM_out), 
            .ResultSrcM_out(ResultSrcM_out), 
            .ALUResultM_out(ALUResultM_out), 
            .ReadDataM(ReadDataM), 
            .RdM_out(RdM_out), 
            .PCPlus4M_out(PCPlus4M_out), 
            .clk(clk)
            );
    
    initial begin
        clk = 0;  
        end
    always begin
        clk = ~clk; #5;  
        end
     
    initial begin 
    MemWriteM = 1'b1;   ALUResultM_in = 32'b0000_0000_0000_0000_0000_0000_0000_0100 ; WriteDataM = 32'b0101;  #100;
    MemWriteM = 1'b1;   ALUResultM_in = 32'b0000_0000_0000_0000_0000_0000_0000_1000 ; WriteDataM = 32'b0111;  #100;
    MemWriteM = 1'b1;   ALUResultM_in = 32'b0011_0000_0100_0110_1100_0010_0001_0000 ; WriteDataM = 32'b1101;  #100;
    MemWriteM = 1'b1;   ALUResultM_in = 32'b1111_1111_1111_1111_1111_1111_1111_1100 ; WriteDataM = 32'b0110;  #100;
    
    MemWriteM = 1'b0;   ALUResultM_in = 32'b0000_0000_0000_0000_0000_0000_0000_0100 ; WriteDataM = 32'b0101;  #100;
    MemWriteM = 1'b0;   ALUResultM_in = 32'b0000_0000_0000_0000_0000_0000_0000_1000 ; WriteDataM = 32'b0111;  #100;
    MemWriteM = 1'b0;   ALUResultM_in = 32'b0011_0000_0100_0110_1100_0010_0001_0000 ; WriteDataM = 32'b0101;  #100;
    MemWriteM = 1'b0;   ALUResultM_in = 32'b1111_1111_1111_1111_1111_1111_1111_1100 ; WriteDataM = 32'b0111;  #100;
    
    end
endmodule
