`timescale 1ns / 1ps

module Fetch_Stage(PCSrc_E, PCTarget_E, Stall_F, clk, rst,
                   RD_F, PC_F, PCPlus4_F 
                   );
       
       //Input Ports
       input wire PCSrc_E, Stall_F, clk, rst;
       input wire [31:0] PCTarget_E;
       
       //Output Ports
       output wire [31:0] RD_F, PC_F, PCPlus4_F;
	   
	   //Internal wires
        wire [31:0]PCF_IN , A, Adder4_Result;
        
        //Blocks instantiation
        PCMUX mux(
                    .pc_plus4(Adder4_Result),
                    .PCTarget(PCTarget_E),
                    .pcsrc(PCSrc_E),
                    .pc_next(PCF_IN)
        );
        
        Program_Counter pc(
                    .clk(clk),
                    .rst(rst),
                    .enable(Stall_F),
                    .PCNext(PCF_IN),
                    .PC(A)
        );

        Instruction_memory imem(
                    .A(A),
                    .RD(RD_F)
        );
        
        Adder_4 adder(
                    .PC(A),
                    .PCPlus4(Adder4_Result)
        );
        
        assign PC_F = A;
        assign PCPlus4_F = Adder4_Result;
        
endmodule
