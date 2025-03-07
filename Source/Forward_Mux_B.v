`timescale 1ns / 1ps

module Forward_Mux_B(RD2_E, Result_W, ALUResult_M, ForwardB_E, SrcB_E);
   
   input [31:0] RD2_E, Result_W, ALUResult_M;                         
   input [1:0] ForwardB_E;                                                       
   output reg [31:0] SrcB_E;                                            

   always @(*) 
   begin
       case (ForwardB_E)
           2'b00: SrcB_E = RD2_E;
           2'b01: SrcB_E = Result_W;
           2'b10: SrcB_E = ALUResult_M;
           default: SrcB_E = RD2_E; // Default case
       endcase
   end          
endmodule
