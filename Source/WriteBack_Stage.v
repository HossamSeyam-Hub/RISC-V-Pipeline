`timescale 1ns / 1ps

module WriteBack_Stage(RegWrite_W_in, ResultSrc_W, ALUResult_W, ReadData_W, PCPlus4_W,
                       RegWrite_W_out, Result_W);
                       
        //input ports
        input wire RegWrite_W_in;
        input wire [1:0] ResultSrc_W;
        input wire [31:0] ALUResult_W, ReadData_W, PCPlus4_W;
        
        //oitput ports
        output wire RegWrite_W_out;
        output wire [31:0] Result_W;
        
        //Block instantiation
        J_LMUX mux(
             .ALUResult(ALUResult_W),
             .ReadData(ReadData_W),
             .PCPlus4(PCPlus4_W),
             .ResultSrc(ResultSrc_W),
             .Result(Result_W)
            );
        
        assign RegWrite_W_out = RegWrite_W_in;
         
endmodule
