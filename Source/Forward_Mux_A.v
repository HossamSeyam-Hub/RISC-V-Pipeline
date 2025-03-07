`timescale 1ns / 1ps

module Forward_Mux_A(RD1_E, Result_W, ALUResult_M, ForwardA_E, SrcA_E);

   input [31:0] RD1_E, Result_W, ALUResult_M;                         
   input [1:0] ForwardA_E;                                                       
   output reg [31:0] SrcA_E;                                            

   always @(*) 
   begin
       case (ForwardA_E)
           2'b00: SrcA_E = RD1_E;
           2'b01: SrcA_E = Result_W;
           2'b10: SrcA_E = ALUResult_M;
           default: SrcA_E = RD1_E; // Default case
       endcase
   end
endmodule
