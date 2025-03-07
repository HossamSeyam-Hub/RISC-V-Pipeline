`timescale 1ns / 1ps

module Hazard_Unit(
    input  reset,  
    input  [4:0] Rs1D, Rs2D,
    input  [4:0] RdE, Rs1E, Rs2E,
    input  PcsrcE, ResultsrcE, RegwriteM, RegwriteW,
    input  [4:0] RdM, RdW,
    output StallF, StallD, FlushD, FlushE,
    output reg [1:0] ForwardAE, ForwardBE
);

    reg lwstall;
    reg StallD_i, FlushD_i, FlushE_i; 
    wire StallF_i;
    
    // Forwarding logic for Rs1E
    always @(*) begin
        if (((Rs1E == RdM) & RegwriteM) & (Rs1E != 0)) 
            ForwardAE = 2'b10; // Forward from Memory Stage
        else if (((Rs1E == RdW) & RegwriteW) & (Rs1E != 0))
            ForwardAE = 2'b01; // Forward from Writeback Stage
        else 
            ForwardAE = 2'b00; // No Forwarding
    end
    
    // Forwarding logic for Rs2E
    always @(*) begin
        if (((Rs2E == RdM) & RegwriteM) & (Rs2E != 0)) 
            ForwardBE = 2'b10; 
        else if (((Rs2E == RdW) & RegwriteW) & (Rs2E != 0))
            ForwardBE = 2'b01; 
        else 
            ForwardBE = 2'b00; 
    end
 
    // Load-use hazard detection
    always @(*) begin
        lwstall = ResultsrcE & ((Rs1D == RdE) | (Rs2D == RdE));
    end
    
    // MUX implementation for StallD
    always @(*) begin
        if (reset)
            StallD_i = 1'b0;
        else
            StallD_i = lwstall;
    end

    // MUX implementation for FlushE
    always @(*) begin
        if (reset)
            FlushE_i = 1'b0;
        else
            FlushE_i = (lwstall | PcsrcE);
    end

    // MUX implementation for FlushD
    always @(*) begin
        if (reset)
            FlushD_i = 1'b0;
        else
            FlushD_i = PcsrcE;
    end
	
	assign StallF_i = StallD_i;
//     //For FPGA
//    assign StallD = StallD_i;
//    assign StallF = StallF_i;
//    assign FlushD = FlushD_i;
//    assign FlushE = FlushE_i;
    

      //For Simulation
      assign StallD = (StallD_i !== 1'b0 && StallD_i !== 1'b1) ? 1'b0 : StallD_i;
      assign StallF = (StallF_i !== 1'b0 && StallF_i !== 1'b1) ? 1'b0 : StallF_i;
      assign FlushD = (FlushD_i !== 1'b0 && FlushD_i !== 1'b1) ? 1'b0 : FlushD_i;
      assign FlushE = (FlushE_i !== 1'b0 && FlushE_i !== 1'b1) ? 1'b0 : FlushE_i;


endmodule
