`timescale 1ns / 1ps

module Pipeline_RISCV(
            
        input wire clk, rst
    );
        
        //internal wires
         wire Stall_F, Flush_D, Stall_D, Flush_E;
         wire [1:0] ForwardA_E, ForwardB_E;
         wire PCSrc_E_out, ResultSrc_E_lsb, RegWrite_M_out, RegWrite_W_out;
         wire [4:0] Rs1_D_out, Rs2_D_out, Rs1_E_out, Rs2_E_out, Rd_E_out, Rd_M_out, Rd_W_out; 

        
        //bloks instantiation
        Stage_Integration SI (
                   .clk(clk), 
                   .rst(rst), 
                   .Stall_F(Stall_F), 
                   .Flush_D(Flush_D), 
                   .Stall_D(Stall_D),
                   .Rs1_D_out(Rs1_D_out), 
                   .Rs2_D_out(Rs2_D_out), 
                   .Flush_E(Flush_E), 
                   .Rs1_E_out(Rs1_E_out), 
                   .Rs2_E_out(Rs2_E_out), 
                   .Rd_E_out(Rd_E_out), 
                   .PCSrc_E_out(PCSrc_E_out), 
                   .ForwardA_E(ForwardA_E), 
                   .ForwardB_E(ForwardB_E), 
                   .ResultSrc_E_lsb(ResultSrc_E_lsb), 
                   .Rd_M_out(Rd_M_out), 
                   .RegWrite_M_out(RegWrite_M_out), 
                   .Rd_W_out(Rd_W_out), 
                   .RegWrite_W_out(RegWrite_W_out)
              );
         
        Hazard_Unit HU(
                  .reset(rst),
                  .Rs1D(Rs1_D_out),
                  .Rs2D(Rs2_D_out),
                  .RdE(Rd_E_out),
                  .Rs1E(Rs1_E_out),
                  .Rs2E(Rs2_E_out),
                  .PcsrcE(PCSrc_E_out),
                  .ResultsrcE(ResultSrc_E_lsb),
                  .RegwriteM(RegWrite_M_out),
                  .RegwriteW(RegWrite_W_out),
                  .RdM(Rd_M_out),
                  .RdW(Rd_W_out),
                  .StallF(Stall_F),
                  .StallD(Stall_D),
                  .FlushD(Flush_D),
                  .FlushE(Flush_E),
                  .ForwardAE(ForwardA_E),
                  .ForwardBE(ForwardB_E)  
              );
        
endmodule
