`timescale 1ns / 1ps

module Fetch_Stage_tb();
    
    // Inputs
    reg PCSrc_E, Stall_F, clk, rst;
    reg [31:0] PCTarget_E;

    // Outputs
    wire [31:0] RD_F, PC_F, PCPlus4_F;

    // Instantiate the module
    Fetch_Stage uut (
        .PCSrc_E(PCSrc_E),
        .PCTarget_E(PCTarget_E),
        .Stall_F(Stall_F),
        .clk(clk),
        .rst(rst),
        .RD_F(RD_F),
        .PC_F(PC_F),
        .PCPlus4_F(PCPlus4_F)
    );

    // Clock generation (10 ns period)
    initial clk = 1'b0; // Set initial value

    always #10 clk = ~clk; // Toggle every 10 time units

    initial begin
        PCSrc_E = 1'b0; Stall_F = 1'b0; rst = 1'b1; PCTarget_E = 32'b00100; #20;
        PCSrc_E = 1'b0; Stall_F = 1'b0; rst = 1'b0; PCTarget_E = 32'b00100; #20;
        PCSrc_E = 1'b0; Stall_F = 1'b0; rst = 1'b0; PCTarget_E = 32'b00100; #20;
        PCSrc_E = 1'b0; Stall_F = 1'b0; rst = 1'b0; PCTarget_E = 32'b00100; #20;
      
        PCSrc_E = 1'b0; Stall_F = 1'b1; rst = 1'b0; PCTarget_E = 32'b00100; #20;
        PCSrc_E = 1'b0; Stall_F = 1'b0; rst = 1'b0; PCTarget_E = 32'b00100; #20;
        PCSrc_E = 1'b1; Stall_F = 1'b0; rst = 1'b0; PCTarget_E = 32'b10000; #20;
        PCSrc_E = 1'b0; Stall_F = 1'b0; rst = 1'b0; PCTarget_E = 32'b00100; #20;
             
    end
endmodule
