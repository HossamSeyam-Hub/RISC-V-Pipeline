`timescale 1ns / 1ps

module Fetch_Decode_Register_tb();

    // 1) Declare local reg and wire identifiers with _tb suffix
    reg [31:0] Instr_F_tb, pc_F_tb, pcplus4_F_tb;
    reg clk_tb, CLR_tb, enable_tb;
    wire [31:0] Instr_D_tb, pc_D_tb, pcplus4_D_tb;

    // 2) Instantiate the Fetch_Decode_Register module under test
    Fetch_Decode_Register UUT (
        .Instr_F(Instr_F_tb),
        .pc_F(pc_F_tb),
        .pcplus4_F(pcplus4_F_tb),
        .Instr_D(Instr_D_tb),
        .pc_D(pc_D_tb),
        .pcplus4_D(pcplus4_D_tb),
        .clk(clk_tb),
        .Flush_D(CLR_tb),
        .Stall_D(enable_tb)
    );
    
    // 3) Clock generation
        initial 
        begin
            clk_tb = 0;  
        end
        
        always
        begin
            clk_tb = ~clk_tb; #5;  
        end
    
    // 4) Generate stimuli using initial and always
    initial 
    begin
        // Initialize  
        CLR_tb = 0; enable_tb = 0; Instr_F_tb = 32'hA; pc_F_tb = 32'h0; pcplus4_F_tb = 32'h4;     #10;
        CLR_tb = 0; enable_tb = 0; Instr_F_tb = 32'hB; pc_F_tb = 32'h4; pcplus4_F_tb = 32'h8;     #10;
        CLR_tb = 0; enable_tb = 0; Instr_F_tb = 32'hC; pc_F_tb = 32'h8; pcplus4_F_tb = 32'hc;     #10;
        CLR_tb = 0; enable_tb = 0; Instr_F_tb = 32'hD; pc_F_tb = 32'hc; pcplus4_F_tb = 32'h10;    #10;
        
        CLR_tb = 1; enable_tb = 0; Instr_F_tb = 32'hA; pc_F_tb = 32'h10; pcplus4_F_tb = 32'h14;   #10;
        CLR_tb = 0; enable_tb = 0; Instr_F_tb = 32'hB; pc_F_tb = 32'h14; pcplus4_F_tb = 32'h18;   #10;
        CLR_tb = 0; enable_tb = 1; Instr_F_tb = 32'hC; pc_F_tb = 32'h18; pcplus4_F_tb = 32'h1c;   #10;
        CLR_tb = 1; enable_tb = 0; Instr_F_tb = 32'hD; pc_F_tb = 32'h1c; pcplus4_F_tb = 32'h20;   #10;
        
        CLR_tb = 0; enable_tb = 0; Instr_F_tb = 32'hA; pc_F_tb = 32'h20; pcplus4_F_tb = 32'h24;   #10;
        CLR_tb = 0; enable_tb = 1; Instr_F_tb = 32'hB; pc_F_tb = 32'h24; pcplus4_F_tb = 32'h28;   #10;
        CLR_tb = 0; enable_tb = 0; Instr_F_tb = 32'hC; pc_F_tb = 32'h28; pcplus4_F_tb = 32'h2c;   #10;
        CLR_tb = 1; enable_tb = 0; Instr_F_tb = 32'hD; pc_F_tb = 32'h2c; pcplus4_F_tb = 32'h30;   #10;
        
        // End simulation
        #120 $stop;
    end
endmodule


