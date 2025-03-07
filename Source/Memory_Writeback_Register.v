`timescale 1ns / 1ps

module Memory_Writeback_Register(ALUResult_M, RD_M, Rd_M, pcplus4_M, ResultSrc_M, RegWrite_M,
                                 ALUResult_W, RD_W, Rd_W, pcplus4_W, ResultSrc_W, RegWrite_W,
                                 clk);

    input [31:0] ALUResult_M, RD_M, pcplus4_M;
    input [4:0] Rd_M;
    input [1:0] ResultSrc_M;
    input RegWrite_M;
    input clk;

    output reg [31:0] ALUResult_W, RD_W, pcplus4_W;
    output reg [4:0] Rd_W;
    output reg [1:0] ResultSrc_W;
    output reg RegWrite_W;
    
    always @(posedge clk)
    begin
            ALUResult_W  <= ALUResult_M;
            Rd_W         <= Rd_M;
            pcplus4_W    <= pcplus4_M;
            RD_W         <= RD_M;
            ResultSrc_W  <= ResultSrc_M;
            RegWrite_W   <= RegWrite_M;
    end
endmodule
