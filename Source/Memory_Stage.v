module MEMORY_STAGE (RegWriteM_in, ResultSrcM_in ,MemWriteM, ALUResultM_in, WriteDataM, RdM_in, PCPlus4M_in, 
                     RegWriteM_out, ResultSrcM_out, ALUResultM_out, ReadDataM, RdM_out, PCPlus4M_out, 
                     clk);
   //Input Ports
    input wire MemWriteM, RegWriteM_in, clk;
    input wire [1:0] ResultSrcM_in;
    input wire [4:0] RdM_in;
    input wire [31:0] ALUResultM_in, WriteDataM, PCPlus4M_in;

    //output ports
    output wire RegWriteM_out;
    output wire [1:0] ResultSrcM_out;
    output wire [4:0] RdM_out;
    output wire [31:0] ALUResultM_out, ReadDataM, PCPlus4M_out;
    
    //Blocks Instantiation
    Data_Memory data_memory (
        .clk(clk),
        .we(MemWriteM),
        .a(ALUResultM_in),
        .wd(WriteDataM),
        .rd(ReadDataM)
    );
    
    assign RegWriteM_out = RegWriteM_in;
    assign ResultSrcM_out = ResultSrcM_in;
    assign ALUResultM_out = ALUResultM_in;
    assign RdM_out = RdM_in;
    assign PCPlus4M_out = PCPlus4M_in;

endmodule